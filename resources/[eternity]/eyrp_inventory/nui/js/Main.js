Inventory = {};

Inventory.EventHandler = function (e) {
  var d = e.data;
  Inventory[d.event] && Inventory[d.event](d.data || {});
};

Inventory.OpenInventory = function (data) {
  $(`#app`).fadeIn(50);

  $(`.inventory-bg .inventory-info`).hide();

  Inventory.Items = data.Items;
  Inventory.Config = data.Config;
  Inventory.Tabs = data.Tabs;

  Inventory.Setup(data.Tabs);

  $(`.personal-information`).html(`
        <div>Kontanter: ${data.Cash.toFixed(2).replace(
          /\d(?=(\d{3})+\.)/g,
          "$&,"
        )} SEK</div>
        <div>Jobb: ${data.Job}</div>
    `);
};

Inventory.CloseInventory = function (data) {
  $(`#app`).fadeOut(50);
  $(`.clone`).remove();

  Inventory.PostMessage("CloseInventory");
};

Inventory.Setup = function (data) {
  $(`.inventory .inventory-tabs`).html("");
  $(`.inventory .dropdown-content`).html("");
  $(`.inventory .inventory-items`).html("");

  var personalOpened = false;
  var otherOpened = false;

  var i;
  for (i = 0; i < data.length; i++) {
    Inventory.CreateTab(data[i]);

    if (data[i].inventory == "personal" && !personalOpened) {
      personalOpened = true;
      Inventory.OpenTab(data[i]);
    } else if (data[i].inventory == "other" && !otherOpened) {
      otherOpened = true;
      Inventory.OpenTab(data[i]);
    }
  }
};

Inventory.PostMessage = function (event, data) {
  $.post(
    "http://eyrp_inventory/EventHandler",
    JSON.stringify({
      event: event,
      data: data || {},
    })
  );
};

window.addEventListener("message", Inventory.EventHandler);
