/* global google */

// hidden_field
const place_address = document.getElementById('gallery_address');
const place_lat = document.getElementById('gallery_latitude');
const place_lng = document.getElementById('gallery_longitude');


let getMap = (function() {
  function codeAddress(address) {
    let geocoder = new google.maps.Geocoder();

    let mapOptions = {
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    let map = new google.maps.Map(document.getElementById("map_display"), mapOptions);

    let marker;

    geocoder.geocode( { 'address': address}, function(results, status) {

      if (status == google.maps.GeocoderStatus.OK) {

        map.setCenter(results[0].geometry.location);

        // hidden_fieldへアドレス,緯度,軽度の保存
        place_address.value = address
        place_lat.value = results[0].geometry.location.lat();
        place_lng.value = results[0].geometry.location.lng();

        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });

      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }

    });

    map.addListener('click', function(e) {
      getClickLatLng(e.latLng, map);
    });

    function getClickLatLng(lat_lng, map) {

      place_lat.value=lat_lng.lat();
      place_lng.value=lat_lng.lng();

      marker.setMap(null);
      marker = new google.maps.Marker({
        position: lat_lng,
        map: map
      });

      map.panTo(lat_lng);
    }
  }


  // 検索
  return {
    getAddress: function() {

      let button = document.getElementById("map_button");
      button.onclick = function() {

        let address = document.getElementById("address").value;

        codeAddress(address);
      }

      window.onload = function(){

        let address = document.getElementById("address").value;

        codeAddress(address);
      }
    }

  };

})();
getMap.getAddress();