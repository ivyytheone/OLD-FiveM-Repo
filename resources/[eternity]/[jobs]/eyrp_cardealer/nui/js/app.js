Funcs = {};

$(() => {

    window.addEventListener('message', (Event) => {
        const Message = Event.data;
        if (Message.Event === 'Open') {
            $('.cardealer').show();
        } else if (Message.Event === 'LoadVehicles') {
            for (i = 0; i < Message.Data.length; i++) {
                $('.list-of-vehicles').append(`<div index=${i} class="category-vehicle"><header>${Message.Data[i].Label}</header></div>`)
            }
        } else if (Message.Event === 'LoadVehicle') {
            document.getElementById('vehicle-image').src = Message.Data.Img || 'https://cdn.discordapp.com/attachments/841036909965738024/872755670137602068/notfound.png';
            $('.right-section header').text(Message.Data.Label);
            $('.right-section p').text(Message.Data.Desc);
            $('#vehicle-price').text(Message.Data.Price + 'kr')
            $('#vehicle-selling-price').text(Message.Data.Price * 1.2 + 'kr')
            console.log()
        } else if (Message.Event === 'FetchOrders') {
            $('#orders').empty()
            for (i = 0; i < Message.Data.length; i++) {
                const Order = Message.Data[i]
                $('#orders').append(`<div class="order"><div class="order-section"><header>Modell</header><h1>${Order.vehicle_label}</h1></div><div class="order-section"><header>Pris</header><h1>${Order.price}kr</h1></div><div class="order-section"><header>Ankommer</header> <h1>${Order.time}</h1></div><button id=${Order.id}>Avbryt beställning</button></div>`)
            }
        } else if (Message.Event === 'ReloadOrderList') {
            $('#orders').empty()
            for (i = 0; i < Message.Data.length; i++) {
                const Order = Message.Data[i]
                $('#orders').append(`<div class="order"><div class="order-section"><header>Modell</header><h1>${Order.vehicle_label}</h1></div><div class="order-section"><header>Pris</header><h1>${Order.price}kr</h1></div><div class="order-section"><header>Ankommer</header> <h1>${Order.time}</h1></div><button id=${Order.id}>Avbryt beställning</button></div>`)
            }
        } else if (Message.Event === 'LoadStockedVehicles') {
            $('.stocked-vehicles').empty();

            for (i = 0; i < Message.Data.length; i++) {
                const Stock = Message.Data[i]
                $('.stocked-vehicles').append(`<div class="stock"><div class="stock-section"><header>Modell</header><h1>${Stock.vehicle_label}</h1></div><div class="stock-section"><header>Försäljningspris</header><h1>${Stock.price * 1.2}kr</h1></div><div class="stock-section"><header>Inköpspris</header><h1>${Stock.price}kr</h1></div><div class="stock-section"><header>Regnummer</header><h1>${Stock.vehicle.plate}</h1></div><button id=${Stock.id} data-price=${Stock.price} data-plate=${Stock.vehicle.plate}>Sälj fordonet</button> </div>`)
            }
        } else if (Message.Event === 'Close') {
            $('.cardealer').hide();
        }

        $('.category-vehicle').on('click', function () {
            $('#vehicle-category-list').removeClass('active');
            tableIndex = parseInt($(this).attr('index')) + 1;
            $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                Event: 'FetchVehicleData',
                Data: tableIndex
            }))
            $('#vehicle-buyer-info').addClass('active');
        })

        $('.order button').on('click', function () {
            $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                Event: 'ReloadOrderList',
                Data: $(this).attr('id')
            }))
            setTimeout(() => {
                $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                    Event: 'RefreshOrderList',
                }))
            }, 100);
        })

        $('.stock button').on('click', function () {
            /* console.log($(this).attr('data-plate')); */
            CloseUi();
            $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                Event: 'SellVehicleToCustomer',
                Data: {
                    Plate: $(this).attr('data-plate'),
                    Price: $(this).attr('data-price') * 1.2,
                    Id: $(this).attr('id')
                }
            }))
        })
    })

    $('#order-vehicle').on('click', function () {
        $('.verify-contract').show();
    })

    $('#cancel-contract').on('click', function () {
        $('.verify-contract').hide();
    })

    $('#verify-contract').on('click', function () {
        $('.verify-contract').hide();
        $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
            Event: 'OrderVehicle',
            Data: tableIndex
        }));
    })

    $('.vtype-category-option').on('click', function () {

        $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
            Event: 'FetchVehicles',
            Data: $(this).attr('category-option')
        }));

        $('#vehicles').removeClass('active');
        $('#vehicle-category-list').addClass('active');
    })

    $('.top-bar-list ul li a').on('click', function () {

        if ($(this).hasClass('active') !== true) {
            // Menyn som lägger till det visuella när man trycker på den 
            $('.verify-contract').hide();
            $('.list-of-vehicles').empty();
            document.getElementById('vehicle-image').src = '';
            $('.right-section header').text('');
            $('.right-section p').text('');
            $('#vehicle-price').text('')
            $('#vehicle-selling-price').text('')
            $('.top-bar-list ul li a.active').removeClass('active')
            $(this).addClass('active')

            //Visa nästa sida
            const pageToShow = $(this).attr('data-page')
            $('.pages .page.active').removeClass('active')
            $('#' + pageToShow).addClass('active')

            if ($(this).attr('data-page') === 'orders') {
                $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                    Event: 'FetchOrders',
                }));
            } else if ($(this).attr('data-page') === 'stock') {
                $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
                    Event: 'LoadStockedVehicles',
                }));
            }

        }
    })


    $(document).keyup(function (e) {
        if (e.keyCode == 27) {
            CloseUi();
        }
    });

    CloseUi = function () {
        $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
            Event: 'Close'
        }))
    }
});

function FilterVehicleModels() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById('vehicle-model-search');
    filter = input.value.toUpperCase();
    list = document.getElementById("list-of-vehicles");
    element = list.getElementsByClassName('category-vehicle');

    for (i = 0; i < element.length; i++) {
        a = element[i].getElementsByTagName("header")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            element[i].style.display = "";
        } else {
            element[i].style.display = "none";
        }
    }
}
