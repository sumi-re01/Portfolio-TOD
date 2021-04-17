/* global google */

// hidden_field
let lat = document.getElementById('gallery_latitude');
let lng = document.getElementById('gallery_longitude');


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

        // hidden_fieldへアドレス、緯度軽度の保存
        document.getElementById('gallery_address').value = address
        lat.value = results[0].geometry.location.lat();
        lng.value = results[0].geometry.location.lng();

        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });

      // ジオコーディングが成功しなかった場合
      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }

    });
  }

  //inputのvalueで検索して地図を表示
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