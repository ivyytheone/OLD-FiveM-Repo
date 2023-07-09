let Dropdown = {};

$(document).on("click", ".dropdown-btn", (event) => {
  const This = event.currentTarget;

  if ($(This).find("i").hasClass("bi-chevron-down")) {
    Dropdown["isOpen"] = true;
  } else {
    Dropdown["isOpen"] = false;
  }

  if (Dropdown["isOpen"] == true) {
    $(document).find(".dropdown-box").show();
  } else {
    $(document).find(".dropdown-box").hide();
  }

  $(This)
    .find("i")
    .replaceWith(
      `<i id="arrow" class="bi bi-chevron-${
        Dropdown["isOpen"] ? "up" : "down"
      }"></i>`
    );
});

$(document).on("click", ".dropdown-item", (event) => {
  $(".dropdown-btn p").text($(event.currentTarget).text());

  $(document).find(".dropdown-box").hide();
  Dropdown.insure = $(event.currentTarget).attr("id");

  $("#arrow").replaceWith(`<i id="arrow" class="bi bi-chevron-down"></i>`);
});

$(document).mouseup(function (e) {
  var container = $(document).find(".dropdown-box");

  // if the target of the click isn't the container nor a descendant of the container
  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container.hide();
    Dropdown["isOpen"] = false;
  }

  $("#arrow").replaceWith(`<i id="arrow" class="bi bi-chevron-down"></i>`);
});

$(document).on("click", ".tabs li", (event) => {
  Insurance.switchPage(event["currentTarget"].id, Insurance.data);
});

$(document).on("click", ".close", (event) => {
  Insurance.close();
});

$(document).on("click", "#submit", (event) => {
  if (!$("input").val()) {
    return;
  }

  Insurance.sendPost("insure", {
    plate: $("#plate").val(),
    insurance: Dropdown.insure,
  });
});

$(document).keydown((key) => {
  if (key.which === 27) {
    Insurance.close();
  }
});
