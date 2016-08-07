//  MAP SEARCH    --------CURRENTLY UNLINKED!!!! EVENTUALLY MAP STUFF WILL BE DONE VIA A LINKED JS FILE
//  ==========   

var center = { lat: 41.9013, lng: -87.6828 }
var address = ['60613', '4252 N Clark St 60613']
      

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {zoom: 8});
  var geocoder = new google.maps.Geocoder;
  var service; 

  function loopZip() {
    for (var i = 0; i < address.length; i++) {
      geocoder.geocode({'address': address[i]}, function(results, status) {
      // console.log(results[0], 'this is reasults')
      console.log(results[0], 'this is results')
      // console.log(results[0].geometry, 'this is results geometry')
      // console.log(results[0].geometry.location.lat(), 'this is google maps geometry')
      var input = new google.maps.LatLng(center.lat, center.lng)
      var shelter = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng())
      // console.log(google.maps.geometry.spherical.computeDistanceBetween(something, somethingElse), 'this is sphericalllllllllll')
      console.log(google.maps.geometry.spherical.computeDistanceBetween(input, shelter), 'this is sphericalllllllllll')
      var distance = google.maps.geometry.spherical.computeDistanceBetween(input, shelter) / 1609.34;
      console.log(distance, 'dddddljaldsfkhalkdhfalsdkfh')
        if (distance <= 5) {
          if (status === 'OK') {
          map.setCenter(center);
          new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
          });
        } else {
          window.alert('Geocode was not successful for the following reason: ' +
              status);
        }
        }
      
      });
    }   
  }
loopZip();
}
initMap()
  
