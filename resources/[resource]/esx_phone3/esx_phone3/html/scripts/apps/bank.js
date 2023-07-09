(function(){

	Phone.apps['bank'] = {};
	const app = Phone.apps['bank'];
	let currentRow = 0;
	const elems = [];

	$('#app-bank .button').each((i,e) => elems.push(e));

	elems.reverse();

	app.open = function(data) {

		$('#phone').css("background-image", "url(https://cdn.discordapp.com/attachments/564475496419557386/647621624840847400/inapp_phone.png)")
		$('.status-bar .status').css("background-image", "url(https://cdn.discordapp.com/attachments/564475496419557386/647642459853160459/Untitled-2.png)")
		$('.status-bar').css("color", "#000");

		if(elems.length > 0)
			app.selectElem(elems[0]);

	}

	app.move = function(direction) {

		switch(direction) {

			case 'TOP': {

				if(currentRow > 0)
					currentRow--;

				break;
			}

			case 'DOWN': {

				if(currentRow + 1 < elems.length)
					currentRow++;

				break;
			}

			default: break;

		}

		app.selectElem(elems[currentRow]);

	}

	app.enter = function() {

		Phone.open('bank-transfer-menu'); 

	}

	app.selectElem = function(elem) {

		currentAction = $(elem).data('action');

		for(let i=0; i<elems.length; i++)
			$(elems[i]).removeClass('selected animated pulse infinite');

		$(elem).addClass('selected animated pulse infinite');
	}

})();