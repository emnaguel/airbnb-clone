function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var boatAddress = document.getElementById('boat_address');

    if (boatAddress) {
      var autocomplete = new google.maps.places.Autocomplete(boatAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(boatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
