$(() => {
    window.addEventListener('message', (event) => {
        var message = event.data; 
        if (message.display) {

            $('.topbar').slideDown(200);
            
        }else if (!message.display) {
            $('.topbar').slideUp(200);
        }
    })
})