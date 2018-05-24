console.log("hello")

import GMaps from 'gmaps/gmaps.js';

let button = document.getElementById('clickme');

button.onclick= function() {
  const mapElement = document.getElementById('map');
  mapElement.style.display = "block";
  mapElement.style.width = "100%";
  mapElement.style.height = "250px";

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
console.log(mapElement.dataset)
const markers = JSON.parse(mapElement.dataset.markers);
map.addMarkers(markers);
if (markers.length === 0) {
  map.setZoom(2);
} else if (markers.length === 1) {
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(14);
} else {
  map.fitLatLngBounds(markers);
}
};
};
//  let map = document.getElementById('map');

// button.addEventListener('clickme', (event) => {
//   map.classList.removeClass("hidden");
//   // do something on click of an element
// });



