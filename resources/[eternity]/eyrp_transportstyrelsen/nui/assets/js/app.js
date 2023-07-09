$(() => {
    window.addEventListener("message", function(Event) {
        const Action = Event.data 

        if (Action.Message == "OPEN") {
            $(".container").fadeIn(400)
        }

        if (Action.Message == "RESPONSE") {
            $(".startpage").fadeOut(200)
            $(".found").fadeIn(200)
            console.log(Action.Data)
            console.log(Action.VehicleModel)
        }  
    })

    $("#search").on("click", function() {

        const value = $("#value").val()
        if(!value) return

        $.post(`https://${GetParentResourceName()}/NuiHandler`, JSON.stringify({
            Event: "SearchVehicle",
            Data: value
        }))
    })

    document.onkeyup = function(Data) {
        if (Data.which == 27) {
            $('.found').hide()
            $(".container").fadeOut(400); 

            $.post(`https://${GetParentResourceName()}/NuiHandler`, JSON.stringify({
                Event: "CLOSE",
            }))
        }
    }
})