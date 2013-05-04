##GoogleMap Service##
#Service for make ajax calls to Google Maps
#
# 
#
WeatherApp.factory "GoogleMap", ($http) ->
  #Get information for a name place
  # params
  # name -> string - callback -> function
  getMapData: (name, callback) ->
    geoco = new google.maps.Geocoder()
    geoco.geocode
      address: name
    , callback

  #Set the position of a google map
  # params
  # canvasId -> string - zoom -> integer - coord -> object - callback -> function
  setMapPos: (canvasId, zoom, coord, callback) ->
    getMap = ->
      if document.getElementById(canvasId)
        map = new google.maps.Map(document.getElementById(canvasId), mapOptions)
        marker = new google.maps.Marker(
          position: new google.maps.LatLng(coord.lat, coord.lon)
          animation: google.maps.Animation.DROP
          title: name
        )
        marker.setMap map
      else
        setTimeout getMap, 500
    map = undefined
    mapOptions =
      zoom: zoom
      center: new google.maps.LatLng(coord.lat, coord.lon)
      scrollwheel: false
      mapTypeId: google.maps.MapTypeId.ROADMAP

    getMap()
