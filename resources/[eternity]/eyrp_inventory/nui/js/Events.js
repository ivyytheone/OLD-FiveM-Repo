$(function () {
    $(document).on('click', '.inventory-tabs .tab', function () {
        var $inventory = $(this).parent().parent().attr('inventory');
        var $name = $(this).attr('name');

        if ($name != 'others') {
            Inventory.OpenTab({
                inventory: $inventory,
                name: $name
            })
        }
    });

    $(document).on('click', '.inventory-bg .inventory ul#other-tabs li a', function () {
        var $inventory = $(this).parent().parent().parent().parent().attr('inventory');
        var $name = $(this).attr('name');

        Inventory.OpenTab({
            inventory: $inventory,
            name: $name
        })
    });

    $(document).on('mousedown', '.inventory-bg .inventory .inventory-items .item', function (e) {
        if (e.which == 2) {
            if ($(this).parent().parent().parent().attr('inventory') == 'personal') {
                var $item = Inventory.GetItem({
                    name: Inventory.ActiveTab[$(this).parent().parent().parent().attr('inventory')],
                    uuid: $(this).attr('uuid')
                })

                if (Inventory.Items[$item.name].useable) {
                    Inventory.PostMessage('ButtonClicked', {
                        item: $item,
                        button: 'use'
                    })
                };
            }
        }
    });

    $(document).on('click', '.inventory-bg .inventory .inventory-items .item', function () {
        var $item = Inventory.GetItem({
            name: Inventory.ActiveTab[$(this).parent().parent().parent().attr('inventory')],
            uuid: $(this).attr('uuid')
        })

        var $desc = Inventory.Items[$item.name].description;

        if ($item.data) {
            for (const property in $item.data) {
                $desc = $desc.replace(`@${property}`, $item.data[property])
            }
        }

        $(`.inventory-bg .inventory-info`).show();
        $(`.inventory-bg .inventory-info`).html(`
            <img src="${$item.data && ($item.data.image) || Inventory.Items[$item.name].image}">
            <p label>${Inventory.Items[$item.name].label}</p>
            <p desc>${$desc}</p>
            <div class="buttons"></div>
        `)

        if ($(this).parent().parent().parent().attr('inventory') == 'personal') {
            if (Inventory.Items[$item.name].useable) {
                $(`.inventory-bg .inventory-info .buttons`).append(`
                    <a class="waves-effect waves-light btn" button="use" style="background:#ff9800">Använd</a>
                `)
            };

            if (Inventory.Items[$item.name].buttons) {
                var i;
                for (i = 0; i < Inventory.Items[$item.name].buttons.length; i++) {
                    if (Inventory.Items[$item.name].buttons[i].icon) {
                        $(`.inventory-bg .inventory-info .buttons`).append(`
                        <a class="btn-floating btn waves-effect waves-light" button=${i + 1} style="background:${Inventory.Items[$item.name].buttons[i].color}"><i class="material-icons">${Inventory.Items[$item.name].buttons[i].icon}</i></a>
                    `)
                    } else {
                        $(`.inventory-bg .inventory-info .buttons`).append(`
                        <a class="waves-effect waves-light btn" button=${i + 1} style="background:${Inventory.Items[$item.name].buttons[i].color}">${Inventory.Items[$item.name].buttons[i].label}</a>
                    `)
                    }
                }
            }

            $(document).off('click', '.inventory-bg .inventory-info .buttons a');
            $(document).on('click', '.inventory-bg .inventory-info .buttons a', function () {
                Inventory.PostMessage('ButtonClicked', {
                    item: $item,
                    button: $(this).attr('button')
                })
            });
        }
    });

    document.onkeydown = function (key) {
        if (key.which == 27 || key.which == 9) {
            Inventory.CloseInventory();
            return
        }
    };
});