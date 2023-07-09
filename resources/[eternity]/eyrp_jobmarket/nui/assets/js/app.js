$(() => {
    window.addEventListener("message", function(Event) {
        const Action = Event.data 

        if (Action.Message == "OPEN") {
            console.log(Action.Data.item)
            $(".container").fadeIn(400)
            $('.products').append(`<div class="product"><img src="${Action.Data.image}" alt=""><span>${Action.Data.label} <strong>${Action.Data.price}kr</strong></span><button>Köp in</button></div>`)
        }
    })

    $("#buy").on("click", function() {

        $.post(`https://${GetParentResourceName()}/NuiHandler`, JSON.stringify({
            Event: "SEARCH",
            Data: [Label = Action.Data.label, Price = Action.Data.price]
        }))
    })
})