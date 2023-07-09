const scriptName = GetParentResourceName();
$(() => {
    window.addEventListener('message', (event) => {
        var message = event.data; 
        if (message.display && message.data) {
                document.getElementById('photo').src = message.data.Image
                $('.container').fadeIn(500);
        }
    })

    // $(document).keyup(function(e) {
    //     if (e.keyCode == 27) {
    //      $('.container').fadeOut(500)
    //    }
    //  });
})