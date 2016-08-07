//  Controls population of second select element on users
//  profile page, dependent on input of first slect element
//  =======================================================

//  Grab the first select element and watch for change
//  --------------------------------------------------
$("#animal-select").change(function() {
  var $dropdown = $(this);
  console.log(this);

  //  Get the JSON file holding info that will populate second select element
  //  -----------------------------------------------------------------------
  $.getJSON("/json/breeds.json", function(data) {
    var key  = $dropdown.val();
    var vals = [];
    
    //  Selector for which data set will populate second select element
    //  ---------------------------------------------------------------
    switch(key) {
      case "dog":
        vals = data.dog.split(",");
        break;
      case "cat":
        vals = data.cat.split(",");
        break;
      case "rabbit":
        vals = data.rabbit.split(",");
        break;
      case "smallfurry":
        vals = data.smallfurry.split(",");
        break;
      case "horse":
        vals = data.horse.split(",");
        break;
      case "bird":
        vals = data.bird.split(",");
        break;
      case "reptile":
        vals = data.reptile.split(",");
        break;
      case "pig":
        vals = data.pig.split(",");
        break;
      case "barnyard":
        vals = data.barnyard.split(",");
        break;
      default:
        vals = ["Select a breed"];
        break;
    }

    //  Grab the second select element, empty it, populate with each option from JSON data
    //  ----------------------------------------------------------------------------------
    var $breedSelect = $("#breed-select");
    $breedSelect.empty();

    $.each(vals, function(index, value) {
      $breedSelect.append("<option>" + value + "</option>");
    });

  });

});


