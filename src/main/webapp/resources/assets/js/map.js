//
// map.js
// Theme module
//

'use strict';

(function() {
  var maps = document.querySelectorAll('[data-toggle="map"]');

  if (maps) {
    [].forEach.call(maps, function(el) {

      // Get map data
      var zoom = parseInt(el.getAttribute('data-zoom'));
      var markers = JSON.parse(el.getAttribute('data-markers'));

      var center = {
        lat: markers[0].position[0],
        lng: markers[0].position[1]
      };

      // Init map
      var map = new google.maps.Map(el, {
        center: center,
        zoom: zoom,
        disableDefaultUI: true
      });

      // Get bounds
      var bounds = new google.maps.LatLngBounds();

      // Create markers
      markers.forEach(function(item, i) {
        var position = {
          lat: item.position[0],
          lng: item.position[1]
        };

        var infowindow = new google.maps.InfoWindow({
          content: item.info
        });

        var marker = new google.maps.Marker({
          position: position,
          map: map
        });

        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });

        // Extend bounds
        bounds.extend(position);
      });

      // Fit markers into bounds
      if (!zoom) {
        map.fitBounds(bounds);
      }
    });
  }

})();
