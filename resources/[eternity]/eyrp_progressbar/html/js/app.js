let Progress = {};

Progress.Start = function (Data) {
  let { Duration, Action } = Data;

  let $ProgressTemplate = $(
    `<div class="Progress InitProgress"><div class="Bar" style="animation-duration: ${
      !(Duration === undefined) ? Duration : 7500
    }ms; background-color: ${!(Data.Color == undefined) ? Data.Color : "orange"}"></div>
        <p>${!(Action === undefined) ? Action : "Ny progress"}</p>
    </div>`
  );

  $ProgressTemplate.appendTo(`#root`);


  setTimeout(() => {
      $ProgressTemplate.fadeOut();

      setTimeout(() => {
        $ProgressTemplate.remove();
      }, 1000);
    },
    !(Duration < 0) ? Duration : 7500
  );
};

Progress.EventHandler = function (Event) {
  const Data = Event.data;
  Progress[Data.Event] && Progress[Data.Event](Data.Data || {});
};

window.addEventListener("message", Progress.EventHandler);
