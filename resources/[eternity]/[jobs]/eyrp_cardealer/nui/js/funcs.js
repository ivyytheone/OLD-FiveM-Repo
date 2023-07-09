Funcs = {};

Funcs.RefreshOrderList = function () {
    $.post('https://eyrp_cardealer/NuiHandler', JSON.stringify({
        Event: 'RefreshOrderList',
    }))
}