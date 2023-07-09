$(() => {
    window.addEventListener('message', (event) => {
        var message = event.data; 
        if (message.display) {
            $('.container').show();
        } else {
            $('.container').hide();
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post(`http://eyrp_rakelbyte/eyrp_rakel:Escape`)
        }
    }

    $('#close').click(() => {
        $.post(`https://eyrp_rakelbyte/eyrp_rakel:Escape`)
    })

    $('#submit').click(() => {

        $.post(`https://eyrp_rakelbyte/eyrp_rakel:Change`, JSON.stringify({
            dob: $('#pnumber').val(),
            rakel: $('#rakelnummer').val()
        }))

    })

})