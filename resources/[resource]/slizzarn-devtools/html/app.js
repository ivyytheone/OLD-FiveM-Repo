$(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case 'copy':
                var text = "";
                if (event.data.type === "h") {
                    text = event.data.coords.heading
                } else if (event.data.type === "4") {
                    text = "vector4(" + event.data.coords.x + ", " + event.data.coords.y + ", " + event.data.coords.z + ", " + event.data.coords.heading + ")"
                } else if (event.data.type === "xyz") {
                    text = '["x"] = ' + event.data.coords.x + ', ["y"] = ' + event.data.coords.y + ', ["z"] = ' + event.data.coords.z
                } else if (event.data.type === "xyzh") {
                    text = '["x"] = ' + event.data.coords.x + ', ["y"] = ' + event.data.coords.y + ', ["z"] = ' + event.data.coords.z + ', ["heading"] = ' + event.data.coords.heading 
                } else if (event.data.type === "3") {
                    text = "vector3(" + event.data.coords.x + ", " + event.data.coords.y + ", " + event.data.coords.z + ")"
                } else {
                    text = '["' + event.data.type + '"] = vector3(' + event.data.coords.x + ", " + event.data.coords.y + ", " + event.data.coords.z + ")"
                }
                copyStringToClipboard(text);
                break
            default:
                console.log("Could not read message with action: " + data.Action)
                break
        }
    });
});

function copyStringToClipboard (coords) {
    var text = document.createElement('textarea');
    text.value = coords;
    text.setAttribute('readonly', '');
    text.style = {position: 'absolute', left: '-9999px'};
    document.body.appendChild(text);
    text.select();
    document.execCommand('copy');
    document.body.removeChild(text);
}