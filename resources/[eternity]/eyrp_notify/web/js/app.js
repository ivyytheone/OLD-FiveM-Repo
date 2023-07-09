const notification = (event) => {
  for (color in colors) {
    if (event.data.message.includes(color)) {
      let colorArray = {};
      colorArray[color] = `<span style="color: ${colors[color]}">`;
      colorArray["~s~"] = `</span>`;

      event.data.message = replaceStr(event.data.message, colorArray);
    }
  }

  let id = $(".notification").length + 1;

  let notificationTpl = $(`
      <div class="notification load ${
        event.data.type ? event.data.type : "info"
      }" id=${id}>
        <div class="container">
          <small class="title">Notifikation</small>
          <p>${
            !(event.data.message == undefined)
              ? event.data.message
              : "Jag heter ~r~ohlson~s~ och jag luktar"
          }</p>
        </div>
      </div>    
    `);

  notificationTpl.appendTo("#root");

  setTimeout(() => {
    notificationTpl.addClass("clear");

    setTimeout(() => {
      notificationTpl.remove();
    }, 500);
  }, event.data.timeout || 7500);
};

const replaceStr = (stringT, obj) => {
  var returnString = stringT;

  for (let id in obj) {
    returnString = returnString.replace(new RegExp(id, "g"), obj[id]);
  }

  return returnString;
};

window.addEventListener("message", notification);
