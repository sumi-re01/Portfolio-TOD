/* global google */

let map;
let geocorder;
let marker;

let lat = document.getElementById('gallery_latitude');
let lng = document.getElementById('gallery_longitude');


function initMap(){
  function codeAddress(address){
      geocorder = new google.maps.Geocoder();
      map = new google.maps.Map(document.getElementById('map_display'));

      geocorder.geocode({'address': address}, function( results, status){
      if( status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);

        let hidden_address = document.getElementById('hidden_address');
        hidden_address.setAttribute("gallery[address]", address);

        let ResultLat = results[0].geometry.location.lat();
        let ResultLng = results[0].geometry.location.lng();

        lat.setAttribute("gallery[latitude]", ResultLat);
        lng.setAttribute("gallery[longitude]", ResultLng);

        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });

      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
        }
    });

  }
}

