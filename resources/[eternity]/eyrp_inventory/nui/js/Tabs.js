Inventory.CreateTab = function (data) {
    if (!(Inventory.Tabs.find(Inv => Inv.name == data.name))) {
        Inventory.Tabs.push(data)
    }

    if ($(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-tabs .tab`).length < 3) {
        $(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-tabs`).append(`
          <a class="tab waves-effect waves-dark" name=${data.name}>
            <p label>${data.title}</p>
          </a>
        `)
    } else {
        if ($(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-tabs .tab[name="others"]`).length == 0) {
            $(`.inventory-bg .inventory[inventory=${data.inventory}] .inventory-tabs`).append(`
            <a class="tab waves-effect waves-dark dropdown-trigger" href="#" data-target="other-tabs-${data.inventory}" name="others">
              <p label>Övriga <span class="material-icons">arrow_drop_down</span></p>
            </a>
          `)

            $(`.inventory-bg .inventory .inventory-tabs .tab[name="others"]`).dropdown()
        }

        $(`.inventory-bg .inventory[inventory=${data.inventory}] ul#other-tabs-${data.inventory}`).append(`
            <li><a class="waves-effect waves-dark" name=${data.name}>${data.title}</a></li>
        `)
    }
};

Inventory.RemoveTab = function (data) {
    var i;
    for (i = 0; i < Inventory.Tabs.length; i++) {
        if (Inventory.Tabs[i].name == data.name) {
            $(`.inventory-bg .inventory[inventory=${Inventory.Tabs[i].inventory}] .inventory-tabs .tab[name=${data.name}]`).remove()

            if (Inventory.ActiveTab[Inventory.Tabs[i].inventory] == data.name) {
                var iv;
                for (iv = 0; i < Inventory.Tabs.length; iv++) {
                    if (Inventory.Tabs[iv].inventory == Inventory.Tabs[i].inventory) {
                        Inventory.OpenTab({
                            inventory: Inventory.Tabs[iv].inventory,
                            name: Inventory.Tabs[iv].name
                        })
                        break
                    }
                }
            }

            Inventory.Tabs.splice(i, 1)
            break
        }
    }
};

Inventory.OpenTab = function (data) {
    let $data = Inventory.GetTab(data.name);

    $(`.inventory-bg .inventory-info`).hide();
    $(`.inventory-bg .inventory[inventory=${$data.inventory}] .inventory-tabs .tab`).removeClass('active');
    $(`.inventory-bg .inventory[inventory=${$data.inventory}] .inventory-tabs .tab[name=${$data.name}]`).addClass('active');

    if (!Inventory.ActiveTab) { Inventory.ActiveTab = {} };

    Inventory.ActiveTab[$data.inventory] = $data.name;
    Inventory.LoadItems($data)
};

Inventory.GetTab = function (name) {
    var i;
    for (i = 0; i < Inventory.Tabs.length; i++) {
        if (Inventory.Tabs[i].name == name) {
            return Inventory.Tabs[i];
            break
        }
    };
};

Inventory.GetEmptySlot = function (name) {
    let Tab = Inventory.GetTab(name);
    let Slot;

    var slot;
    for (slot = 0; slot < Tab.slots; slot++) {
        let Empty = true;

        var i;
        for (i = 0; i < Tab.items.length; i++) {
            if (parseInt(Tab.items[i].slot) == slot) {
                Empty = false;
                break
            }
        }

        if (Empty) {
            Slot = slot
            break
        }
    }

    return Slot.toString() || false
};

Inventory.IsSlotEmpty = function (data) {
    let $data = Inventory.GetTab(data.name);

    if ($(`.inventory-bg .inventory[inventory=${$data.inventory}] .inventory-items .item-slot[slot=${data.slot}] .item`).length > 0) {
        return true
    } else {
        return false
    }
};
