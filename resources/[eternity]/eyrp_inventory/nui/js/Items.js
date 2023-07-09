Inventory.AddItem = function (data) {
    if (!Inventory.ActiveTab) { return };
    let tab = Inventory.GetTab(data.name);

    if (data.insert) {
        tab.items.push(data.item)
    };

    if (Inventory.ActiveTab[tab.inventory] == data.name) {
        let $itemTpl = `<div class="item ${(data.inventory == 'personal' && data.name.includes('pocket') && ((data.item.slot || Inventory.GetEmptySlot(data.name)) < 4)) ? 'hotkey' : ''}" uuid=${data.item.uuid}>
            <img src=${data.item.image || (Inventory.Items[data.item.name] && Inventory.Items[data.item.name].image) || ''}>
            <p label>${data.item.label || (Inventory.Items[data.item.name] && Inventory.Items[data.item.name].label) || data.item.name}</p>
        </div>`;

        $($itemTpl).appendTo(`.inventory-bg .inventory[inventory=${tab.inventory}] .inventory-items .item-slot[slot=${data.item.slot || Inventory.GetEmptySlot(data.name)}]`).draggable({
            zIndex: 99999,
            scroll: false,
            revert: 'invalid',
            cursorAt: {
                top: 50,
                left: 50
            },
            start: function (e, ui) {
                $(`.inventory-bg .inventory-info`).hide();
                Inventory.Dragging = true;
                $(this).hide()
            },

            stop: function (e, ui) {
                Inventory.Dragging = false;
                $(this).show()
            },

            helper: function () {
                let $inventory = $(this).parent().parent().parent().attr('inventory');
                let $uuid = $(this).attr('uuid');
                let $helper = $(this).clone();

                let $itemD = Inventory.GetItem({
                    name: Inventory.ActiveTab[$inventory],
                    uuid: $uuid
                });

                $helper.html(`
                  <div class="item" data=${JSON.stringify($itemD)}>
                    <img src=${$itemD.image || (Inventory.Items[$itemD.name] && Inventory.Items[$itemD.name].image) || ''}>
                  </div>`
                );

                $($helper).addClass('clone');

                $(`body`).append($helper);
                return $helper
            }
        });
    };
};

Inventory.RemoveItem = function (data) {
    if (!Inventory.ActiveTab) { return };
    let tab = Inventory.GetTab(data.name);

    if (data.remove) {
        var i;
        for (i = 0; i < tab.items.length; i++) {
            if (tab.items[i].uuid == data.item.uuid) {
                tab.items.splice(i, 1);
            }
        }
    }

    if (Inventory.ActiveTab[tab.inventory] == data.name) {
        $(`.inventory-bg .inventory[inventory=${tab.inventory}] .inventory-items .item[uuid=${data.item.uuid}]`).remove();
    }
};

Inventory.UpdateItem = function (data) {
    let $data = Inventory.GetTab(data.name);

    var i;
    for (i = 0; i < $data.items.length; i++) {
        if ($data.items[i].uuid == data.uuid) {
            for (const value in data.data) {
                $data.items[i][value] = data.data[value]
                console.log(value, data.data[value])
            }

            break
        }
    };

    // if (Inventory.ActiveTab[$data.inventory] == data.name) {
    //     $(`.inventory-bg .inventory[inventory=${$data.inventory}] .inventory-items`)
    // };

    // Inventory.UpdateItem({
    //     name: TAB,
    //     uuid: UUID,
    //     data: {
    //         label: 
    //     }
    // })
};

Inventory.GetItem = function (data) {
    let $data = Inventory.GetTab(data.name);

    var i;
    for (i = 0; i < $data.items.length; i++) {
        if ($data.items[i].uuid == data.uuid) {
            return $data.items[i];
            break
        }
    };
};

Inventory.LoadItems = function (data) {
    $(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-items`).html('');

    var i;
    for (i = 0; i < data.slots; i++) {
        $(`<div class="item-slot" slot=${i}>${(data.inventory == 'personal' && data.name.includes('pocket') && (i < 4)) ? `<div class="hotkey">${i + 1}</div>` : ''}</div>`).appendTo(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-items`).droppable({
            drop: function (e, ui) {
                Inventory.Dragging = false;

                let lastInventory = {
                    inventory: $(ui.draggable).parent().parent().parent().attr('inventory'),
                    name: Inventory.ActiveTab[$(ui.draggable).parent().parent().parent().attr('inventory')],
                    item: Inventory.GetItem({
                        name: Inventory.ActiveTab[$(ui.draggable).parent().parent().parent().attr('inventory')],
                        uuid: $(ui.draggable).attr('uuid')
                    })
                };

                let Response = true;
                let Tab = Inventory.GetTab(Inventory.ActiveTab[$(this).parent().parent().attr('inventory')]);

                if (Tab.data) {
                    if (Tab.data.denied) {
                        var i;
                        for (i = 0; i < Tab.data.denied.length; i++) {
                            if (Tab.data.denied[i] == lastInventory.item.name) {
                                Response = false;
                                break
                            }
                        }
                    } else if (Tab.data.allowed) {
                        var i;
                        for (i = 0; i < Tab.data.allowed.length; i++) {
                            if (Tab.data.allowed[i] == lastInventory.item.name) {
                                Response = true;
                                break
                            } else {
                                Response = false;
                            }
                        }
                    }
                }

                if (Inventory.IsSlotEmpty({
                    name: Inventory.ActiveTab[$(this).parent().parent().attr('inventory')],
                    slot: $(this).attr('slot')
                })) { Response = false }

                if (!Response) {
                    Inventory.LoadItems(Inventory.GetTab(lastInventory.name));
                    ui.draggable.remove();
                    return
                };

                let newItem = Inventory.GetItem({
                    name: lastInventory.name,
                    uuid: $(ui.draggable).attr('uuid')
                });

                newItem.slot = $(this).attr('slot');

                let newInventory = {
                    inventory: $(this).parent().parent().attr('inventory'),
                    name: Inventory.ActiveTab[$(this).parent().parent().attr('inventory')],
                    item: newItem
                };

                ui.draggable.remove();
                $('.clone').remove();

                if (lastInventory.inventory == 'personal' && newInventory.name == 'ground') {
                    Inventory.PostMessage('AddGround', lastInventory.item);
                    Inventory.PostMessage('RemoveItem', lastInventory);
                    return
                } else if (lastInventory.name == 'ground' && newInventory.inventory == 'personal') {
                    Inventory.PostMessage('RemoveGround', lastInventory.item);
                    Inventory.PostMessage('AddItem', newInventory);
                    return
                };

                Inventory.PostMessage('RemoveItem', lastInventory);
                Inventory.PostMessage('AddItem', newInventory)
            }
        })
    };

    var i;
    for (i = 0; i < data.items.length; i++) {
        Inventory.AddItem({
            inventory: data.inventory,
            name: data.name,
            item: data.items[i]
        })
    };
};