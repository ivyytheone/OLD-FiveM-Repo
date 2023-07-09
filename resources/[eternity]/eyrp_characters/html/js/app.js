
$(document).ready(function(){
    $(".character-box").hover(
        function() {
            $(".character-box").removeClass('active-char');
            $(this).addClass('active-char');
            $(this).find(".buttons #play-char").fadeIn();
            if ($(this).attr("data-ischar") === "true") {
                $(this).find(".buttons #delete").fadeIn();
            } else {
                $(this).find(".buttons").css("margin-left", "-160px")
                $(this).find(".buttons button").css("width", "100px")
                $(this).find(".buttons #play-char").html("Skapa")
            };
        }, function() {
            $(this).find(".buttons #play-char").hide()
            $(this).find(".buttons #delete").hide()
        }
    );

    $(document).on("click", "#play-char" , function() {
        if ($('.active-char').attr("data-ischar") === "true") {
            $('.main-container').css({"display":"none"});
            $('.choose-location').css({"display":"block"});
            $('.nummer1').css({"display":"none"});
            $('.numbers2').css({"display":"none"});
            $('.numbers3').css({"display":"none"});
            $('.numbers4').css({"display":"none"});
        } else {
            $.post("http://eyrp_characters/CharacterChosen", JSON.stringify({
                charid: $('.active-char').attr("data-charid"),
                ischar: $('.active-char').attr("data-ischar"),
            }));
            Kashacter.CloseUI()
        }
    });


    $("#deletechar").click(function () {
        $.post("http://eyrp_characters/DeleteCharacter", JSON.stringify({
            charid: $('.active-char').attr("data-charid"),
        }));
        Kashacter.CloseUI();
    });

    $(".choose-location #back").click(function () {
        $('.main-container').css({"display":"block"});
        $('.choose-location').css({"display":"none"});
        $('.nummer1').css({"display":"flex"});
        $('.numbers2').css({"display":"flex"});
        $('.numbers3').css({"display":"flex"});
        $('.numbers4').css({"display":"flex"});
    });

    $(".choose-location .locations button").click(function () {
        $.post("http://eyrp_characters/CharacterChosen", JSON.stringify({
            charid: $('.active-char').attr("data-charid"),
            ischar: $('.active-char').attr("data-ischar"),
            location: this["id"]
        }));
        Kashacter.CloseUI()
    });
});

(() => {
    Kashacter = {};

    Kashacter.ShowUI = function(data) {
        $('.main-container').css({"display":"block"});
        if(data.characters !== null) {
            $.each(data.characters, function (index, char) {
                if (char.charid !== 0) {
                    var charid = char.identifier.charAt(4);
                    $('[data-charid=' + charid + ']').html('<h3 class="character-fullname">'+ char.firstname +' '+ char.lastname +'</h3><hr class="hr_top"><div class="character-info"><p class="character-info-work"><strong>Yrke: </strong><span>'+ char.job +' - ' + char.job_grade + '</span><br></p> <p class="character-info-gender"><strong>Kön: </strong><span>'+ char.sex +'</span></p><p class="character-info-bank"><strong>Bankkonto: </strong><span>'+ char.bank +'</span></p><p class="character-info-money"><strong>Kontanter: </strong><span>'+ char.money +'</span></p><p class="character-info-dateofbirth"><strong>Personnummer: </strong><span>'+ char.dateofbirth +'</span></p> <p class="character-info-number"><strong>Telefonnummer: </strong><span>'+ char.phone_number +'</span></p></div><div class="buttons" style="margin-top: 90px;"><button id="play-char" style="display:none" data-target="#play-char">SPELA</button><button id="delete" style="display:none" data-toggle="modal" data-target="#delete-char">RADERA</button></div>').attr("data-ischar", "true");
                }
            });
        }
    };

    Kashacter.CloseUI = function() {
        $('.main-container').css({"display":"none"});
        $('.choose-location').css({"display":"none"});
        $('.nummer1').css({"display":"none"});
        $('.numbers2').css({"display":"none"});
        $('.numbers3').css({"display":"none"});
        $('.numbers4').css({"display":"none"});
        $(".character-box").removeClass('active-char');
        $("#delete").css({"display":"none"});
        $(".character-box").html('<h3 class="character-fullname">Skapa karaktär</h3><hr class="hr_top"><div class="character-info"><p class="character-info-new"></p></div><div class="buttons"><button id="play-char" style="display:none" data-target="#play-char">SPELA</button></div>').attr("data-ischar", "false");
    };
    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case 'openui':
                    Kashacter.ShowUI(event.data);
                    break;
            }
        })
        
    }

})();