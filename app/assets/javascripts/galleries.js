function initMap() {
  /* global google */
  const myLatLng = { lat: Number(window.lat), lng: Number(window.lng) };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 10,
    center: myLatLng,
  });
  new google.maps.Marker({
    position: myLatLng,
    map,
  });
}