//  SEARCH THE PETFINDER.COM API FOR PET INFO
//  =========================================

//  Variables for API request are imported from
//  the request.erb view (animal, breed, zip)
//  -------------------------------------------
var petCards = [];
var myResult;
$.ajax({
  url:'http://api.petfinder.com/pet.find',
  type: 'GET',
  data: {
    key:      key,
    format:   "json",
    animal:   animal,
    breed:    breed,
    location: zip,
    count:    50,
    output:   "full"
  },
  dataType: 'jsonp',
  success: function(result) {
    console.log(result);
    for (var i in result.petfinder.pets.pet) {
      $(".pet-card-holder").append("<div class='pet-card col-4'><p>Here is a pet card.</p></div>");
      petCards.push(result.petfinder.pets.pet[i]);
    };
  },
  error: function(err){
    console.log(err);
  }
});

console.log(petCards);
