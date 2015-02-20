function gmap_show(product) {
if ((product.latitude == null) || (product.longitude == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "lat": product.latitude,    // coordinates from parameter product
        "lng": product.longitude,
        "picture": {    // setup marker icon
          "url": 'http://www.ssmh.org/wp-content/uploads/leaflet-maps-marker-icons/letter_g.png',
          "width":  32,
          "height": 37
        },
        "infowindow": "<b>" + product.name + "</b> de " + product.place
      }
    ]);
    handler.bounds.extendWith(markers);
    _.each(markers, function(marker){
      google.maps.event.trigger(marker.getServiceObject(), 'click');
    });
    handler.fitMapToBounds();
    handler.getMap().setZoom(7);    // set the default zoom of the map
  });
}