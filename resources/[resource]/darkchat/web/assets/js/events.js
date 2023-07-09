$(() => {
    $('#send').on('click', function(){
        if( $('#text').val() ) {
            $.post('https://darkchat/NuiHandler', JSON.stringify({
                event: 'AddMessage',
                data: $('#text').val()
            })); 
        }
    })
}); 