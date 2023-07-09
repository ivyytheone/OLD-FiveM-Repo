Insurance = {};

Insurance.open = (data) => {
  $container = $("#root");

  Insurance.data = data;

  $container.html(`
      <div class="container">

        <div class="welcome">
          <p>${data.player.character["firstname"]} ${data.player.character["lastname"]}</p>
          <small>${data.player.character["id"]}</small>
        </div>

        <div class="top">
            <div class="close"></div>
        </div>

        <header>
          <div class="brand">
            <img
              src="https://theinformationcompany.se/app/uploads/trygghansa-logosek.png"
            />
          </div>

          <ul class="tabs">
            <li id="insure">Försäkra fordon</li>
            <li id="search">Sök upp fordon</li>
          </ul>
        </header>

        <div class="content"></div>
      </div>    
    `);

  Insurance.switchPage("insure", data);

  //   const $dropdown = $(".dropdown-box");
  //   $dropdown.empty();
};

Insurance.close = () => {
  $("#root").empty();

  Insurance.sendPost("close");
};

Insurance.sendPost = (event, data, cb) => {
  $.post(
    "https://eyrp_trygghansa/" + event,
    JSON.stringify(data ? data : {}),
    cb
  );
};

Insurance.switchPage = (page, data) => {
  $(`li`).removeClass("current");

  $(`#${page}`).addClass("current");

  $(".content").empty();

  switch (page) {
    case "insure": {
      $(".content").html(`
        <div class="form">
            <div class="field">
              <input
                  type="text"
                  id="plate"
                  maxlength="6"
                  spellcheck="false"
                  placeholder="Registreringsnummer (ABC123)"
              />
            </div>
            <div class="field">
                <div class="dropdown-btn" type="insure">
                    <p>Välj typ av försäkring</p>
                    <i id="arrow" class="bi bi-chevron-down"></i>
                </div>

                <div class="dropdown-box" type="insure"></div>
              </div>
   
              <div class="actions">
                <button id="submit">Försäkra</button>
              </div>
        </div>`);

      const $dropdown = $(".dropdown-box[type='insure']");

      $dropdown.empty();
      data.insurance["map"]((data) => {
        $dropdown.append(`
            <div class="dropdown-item" id="${data.name}">
              <p>${data.name}</p>
              <small>${data.price} SEK</small>
            </div>
          `);
      });

      break;
    }
    case "search": {
      $(".content").html(`
            <div class="form">
                <div class="field">
                    <input id="search"  onchange="Insurance.search(event)" placeholder="Sök upp ett fordon (ABC123)" />

                    <button style="margin-top: 15px;" class="submitSearch floating" onclick="Insurance.search(event)">Sök</button>
                </div>
            </div>


            <div class="success"></div>
          `);
      break;
    }
  }
};

Insurance.search = (event) => {
  let plate = $(".content").find("#search").val();
  let htmlTpl = ""

  Insurance.sendPost(
    "search",
    { plate: plate, length: plate.length },
    (data) => {
      data.map((vehicle) => {
        Insurance["type"] = vehicle.insured;
        const append = $(".success");


        (vehicle.plate.trim() === plate) ? htmlTpl = `<div class="vehicle"><div class="head"><p>${vehicle.plate}</p></div><p>Försäkring: ${!(vehicle.insured === undefined) ? "<small style='color: green !important;'>" + vehicle.insured + "</small>" : "<small style='color: red !important;'>Inte försäkrad</small>"}</p><p>Status: <small>${!(vehicle.insured === "") ? "I trafik" : "Avställd"}</small></p><p>Modell: <small>${vehicle.model}</small></p></div>` : htmlTpl = `<div>${plate} finns inte</div>`
        
        console.log(vehicle.plate, plate)

        append.html(htmlTpl);
      });
    }
  );
};

Insurance.eventHandler = (event) => {
  const data = event.data;

  Insurance[data.event] && Insurance[data.event](data.data);
};

window.addEventListener("message", Insurance.eventHandler);
