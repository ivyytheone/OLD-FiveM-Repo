var Cache = {
  Products: {},
  BTN_LABEL: "Buy Now",
};

const LoadConfigTabs = (Data) => {
  $(".categories ul").empty();
  for (const [tabI, tabD] of Object.entries(Data.Tabs)) {
    $(`
      <li class="tab transitionIn waves-effect waves-ripple waves-light" id="${tabI}">
        ${tabD.Label} - ${
      tabD.Items.length ? tabD.Items.length + " Produkter" : "Inga produkter"
    }
      </li> 
    `).appendTo(`.categories ul`);
  }
};

function LoadStore(Data) {
  $(`.wrapper`).fadeIn();
  $(`#app`).fadeIn();

  $(".tab").removeClass("current");
  $("#0").addClass("current");

  LoadConfigTabs(Data);
  SwitchCategory("0", Data);
}

function SwitchCategory(Category, Data) {
  $(`.products`).html(``);
  $(`.label`).html(Data.Tabs[Category].Label);

  if (Data.Tabs[Category].Items.length === 0) {
    $(".label").append(
      `<p style="padding: 1rem; border-bottom: 1px solid lightcoral; border-radius: 1vh; color: lightcoral" class="transitionIn">No items here, add some</p>`
    );
  }

  Data.Tabs[Category].Items.map((data) => {
    $(`
        <div class="product transitionIn" price="${data.price}">
          <div class="image">
            <img src="${data.image}" />
          </div>
          <div class="info">
            <p>${data.label} <br><small class="price">${data.price} ${
      Data.Currency ? Data.Currency : "SEK"
    }</small></p>
          </div>
          <div class="buy">
            <a id="buy" category="${Category}" item='${JSON.stringify(
      data
    )}' class="waves-effect waves-ripple waves-light green btn btn-floating btn-small">
            <i class="bi bi-cart-plus"></i>
            </a>
          </div>        
        </div>
      `).appendTo(`.products`);
  });
}

function ExecuteMessage(event, data) {
  $.post(
    "https://eyrp_stores/eventHandler",
    JSON.stringify({
      event: event,
      data: data || {},
    })
  );
}

$(document).on("click", ".close", function () {
  HideStore();
  $(".buy-modal").hide();
});

function HideStore() {
  $(`.wrapper`).hide();
  $(`#app`).hide();
  $(".products").removeClass("blur");
  $(".categories").removeClass("blur");
  ExecuteMessage("close");
}

window.addEventListener("message", function (event) {
  let Data = event.data;

  switch (Data.Event) {
    case "show": {
      LoadStore(Data.Data);
      break;
    }
  }

  $(document).on("click", ".tab", function (event) {
    $(".tab").removeClass("current");

    $(this).addClass("current");
    SwitchCategory(event.currentTarget.id, Data.Data);
  });

  document.onkeydown = function (event) {
    if (event.which === 27) {
      HideStore();
    }
  };
});

$(document).on("click", "#buy", function (e) {
  // parsing the json object attribute
  let item = $(e.currentTarget).attr("item");
  // sending the item to the lua
  ExecuteMessage("buyItems", {
    price: parseInt(JSON.parse(item).price),
    Category: parseInt($(e.currentTarget).attr("category")) + 1,
    item: JSON.parse(item),
  });
});
