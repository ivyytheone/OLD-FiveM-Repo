Inventory.AddGround = function(data) {
    Inventory.AddItem({
        name: 'ground',
        item: data.item,
        insert: true
    })
}

Inventory.RemoveGround = function(data) {
    Inventory.RemoveItem({
        name: 'ground',
        item: data,
        remove: true
    })
}