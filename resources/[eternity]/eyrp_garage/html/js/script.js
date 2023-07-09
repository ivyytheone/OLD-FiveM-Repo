const scriptName = GetParentResourceName()
$(() => {
    window.addEventListener('message', function (event) {
        const message = event.data;
        if (message.open) {
            $('.container').fadeIn();
            if (message.info.garage) {
                document.getElementById('garagelabel').innerHTML = message.info.garage.Label;
            }
            if (message.info) {
                if (message.info.vData) {
                    if (message.info.vehicleArray) {
                        const engineHealth = parseInt(message.info.vehicleArray.engineHealth / 10)
                        $('.vehicles').append(`<div class="vehicle"><header>${message.info.vLabel}<header><button class='spawnvehicle' id=${message.info.vData.id}><i class="fas fa-play"></i></button><span class="vinfo plate">Registreringsskylt: ${message.info.vehicleArray.plate}</span><span class="vinfo">Bränsle: ${message.info.vehicleArray.fuelLevel}%</span><span class="vinfo">Motorhälsa: ${engineHealth}%</span></div>`)
                    }
                    $('#' + message.info.vData.id).on('click', function () {
                        closeUi()
                        $.post(`https://${scriptName}/TakeOutVehicle`, JSON.stringify({
                            vInfo: message.info.vData,
                            vArray: message.info.vehicleArray,
                            gInfo: message.info.garage
                        }))
                    })
                }
            }

        } else {
            $('.container').fadeOut();
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            closeUi()
        }
    }
    closeUi = function () {
        $('.container').fadeOut();
        $('.vehicles').empty();
        $('#filter').val('');
        $.post(`https://${scriptName}/exit`);
    }
})

function filterVehicles() {
    // Declare variables
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById('filter');
    filter = input.value.toUpperCase();
    ul = document.getElementById("vehicles-search");
    li = ul.getElementsByClassName('vehicle');

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("header")[0] || li[i].getElementsByClassName("plate")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}