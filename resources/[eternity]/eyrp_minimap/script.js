$(function() {
    window.addEventListener("message", function(event) {
        var data = event.data;
        switch(data.action) {
            case "displayUI":
                $(".mapborder").fadeIn();
                break;
            case "hideUI":
                $(".mapborder").fadeOut();
                break;
        }
        if (data.waypointActive === true) {
            $(".waypoint-text").fadeIn();
            $(".waypoint-text p").text(data.distance + "km");
        } else if (data.waypointActive ===false) {
            $(".waypoint-text").fadeOut();
        }
        if (data.showCompass === true) {
            $(".compass-app-wrapper").fadeIn();
            $(".comp4").css("background-position-x", data.heading);
            $(".comp3 p").text(data.area);
            $(".comp5 p").text(data.street);
            $(".comp6 p").text(data.time);
        } else if (data.showCompass ===false) {
            $(".compass-app-wrapper").fadeOut();
        }
    });
});