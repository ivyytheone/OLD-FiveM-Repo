ESX = {}

Heap = {
    SmashedTrays = {}
}

TriggerEvent("esx:getSharedObject", function(library)
    ESX = library

    RegisterCallbacks(ESX)
end)