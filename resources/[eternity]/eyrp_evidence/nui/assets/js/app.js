$(() => {
    window.addEventListener("message", function(Event) {
        const Action = Event.data 

        if (Action.Message == "OPEN") {
            $('.found').hide()
            $('.startPage').show()
            $(".container").fadeIn(400)
        }else if (Action.Message == 'RESPONSE'){
            $('.startPage').fadeOut(400)
            $('.found').fadeIn(250)

            $('#firstname').text(Action.Data.firstname)
            $('#lastname').text(Action.Data.lastname)
            $('#dob').text($("#value").val())

            document.getElementById("charpic").src = Action.Data.image

            $("#open").on("click", function() {
                $('.container').fadeOut(400)
    
                Callback = [Action.Data.firstname, Action.Data.lastname, $("#value").val()]
    
                $.post(`https://${GetParentResourceName()}/NuiHandler`, JSON.stringify({
                    Event: "OPEN_INV",
                    Data: Callback
                }))
            })
        }
    })

    $("#search").on("click", function() {

        const value = $("#value").val()
        if(!value) return

        $.post(`https://${GetParentResourceName()}/NuiHandler`, JSON.stringify({
            Event: "SEARCH",
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