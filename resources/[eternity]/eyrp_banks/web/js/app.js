$(() => {
    window.addEventListener("message", function(Event) {
        const Action = Event.data 
        
        if (Action.Message == "OPEN_BANK") {
            $(".container").fadeIn(400)

            document.getElementById('PlayerBank').innerHTML = Action.Data.PlayerBank;
        }
    })

    $("#withdraw-button").click(() => {
        var amount = $('#withdraw-amount').val()

        $.post(`http://eyrp_banks/withdraw`, JSON.stringify({
            amount: amount
        })) 
    })

    $("#deposit-button").click(() => {
        var amount = $('#withdraw-amount').val()

        $.post(`http://eyrp_banks/deposit`, JSON.stringify({
            amount: amount
        })) 
    })

    document.onkeyup = function(Data) {
        if (Data.which == 27) {
            $(".container").fadeOut(400);
            $('.withdraw-container').fadeOut(400);
            $('.deposit-container').fadeOut(400);

            $.post("http://eyrp_banks/closeBank", JSON.stringify({}))
        }
    }
})

withdraw = function() {
    $('.container').hide();
    $('.withdraw-container').show();
}

deposit = function() {
    $('.container').hide();
    $('.deposit-container').show();
}

back = function(Data) {
    $(Data).hide();
    $('.container').show();
}