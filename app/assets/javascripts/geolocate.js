var x;
var geocoder;
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
    // console.log(position.coords);
    geocodeLatLng(geocoder, position)
    $("input#search_lat").val(position.coords.latitude);
    $("input#search_long").val(position.coords.longitude);
}


function geocodeLatLng(geocoder, position) {
  
  var latlng = {lat: parseFloat(position.coords.latitude), lng: parseFloat(position.coords.longitude)};
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        $("#approx-loc").text(results[1].formatted_address);
        $("input#search_location").val(results[1].formatted_address);
      }
    }
  });
}

$(document).ready(function(){
  x = document.getElementById("approx-loc");
  geocoder = new google.maps.Geocoder();
  getLocation();
});