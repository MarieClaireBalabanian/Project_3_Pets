<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDntNQvZ1AMlJwJDnwycxyLWJcJvZUmCfk&libraries=places&libraries=geometry"></script>

  
<script>
  var animal = '<%= @animal %>';
  var breed  = '<%= @breed %>';
  var zip = '<%= @zip %>';
  var userLat = '<%= @userLat %>';
  var userLng = '<%= @userLng %>';
  var petInfo = <%= @petInfo %>;

  

  var center = { lat: parseFloat(userLat), lng: parseFloat(userLng) }

    function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {zoom: 8});
      var geocoder = new google.maps.Geocoder;
   

      function loopZip() {
        for (var i = 0; i < petInfo.length; i++) {
          geocoder.geocode({'address': petInfo[i][0]}, function(results, status) {
            // console.log(results)
          console.log(results[0], 'this is results')
          console.log(results[0].geometry, 'this is results geometry')    
          var input = new google.maps.LatLng(center.lat, center.lng)
          var shelter = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng())
     
          console.log(shelter.lat(),shelter.lng())

          console.log(shelter)
     
          var distance = google.maps.geometry.spherical.computeDistanceBetween(input, shelter) / 1609.34;
          console.log(distance, 'this is distance')
            if (distance <= 25) {
              if (status === 'OK') {
                map.setCenter(center);

                for (var i = 0; i < petInfo.length; i++) { 

                  var petName = petInfo[i][1]
                  var infowindow = new google.maps.InfoWindow({content: petName});
                  var marker = new google.maps.Marker({ map: map, position: results[0].geometry.location });
                  google.maps.event.addListener(marker, 'click', function() { infowindow.open(map,marker) });
                }
                


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
    </script>
