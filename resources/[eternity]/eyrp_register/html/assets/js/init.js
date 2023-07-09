$(document).ready(function(){
  $('select').formSelect();

  // LUA event listener
  window.addEventListener('message', function(event) {
    if (event.data.action == 'open') {
      $('#overlay').show();
    } else if (event.data.action == 'close') {
      $('#overlay').hide();
    }
  });

  // Register button
  $('#register').click(function() {
    if ($('#lastname').val() != '' && $('#firstname').val() != '' && $('#dateofbirth').val() != '' && $('#sex').val() != '' && $('#height').val() != '') {
      if ($('#height').val().length > 1 && $('#dateofbirth').val().length == 10) {
        var dob = $('#dateofbirth').val();

        $.post('http://eyrp_register/register', JSON.stringify({
          firstname: $("#firstname").val(),
          lastname: $("#lastname").val(),
          dateofbirth: $("#dateofbirth").val(),
          sex: $("#sex").val(),
          height: $("#height").val()
        }));
      }
    }
  });

  // Disable space on the input
  $("form").on({
	  keydown: function(e) {
	    if (e.which === 32)
	      return false;
	  },
	});

  // Disable form submit
  $("form").submit(function() {
		return false;
	});
});
