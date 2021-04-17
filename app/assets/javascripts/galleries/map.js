function initMap() {
  /* global google */
  const place_LatLng = { lat: Number(window.lat), lng: Number(window.lng) };
  const map = new google.maps.Map(document.getElementById("map_display"), {
    zoom: 13,
    center: place_LatLng,
  });
  new google.maps.Marker({
    position: place_LatLng,
    map,
  });
}