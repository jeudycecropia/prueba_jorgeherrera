##MainCtrl##
#Controller for the home page
#
#
#
WeatherApp.controller "MainCtrl", ($scope, $rootScope, $http, WeatherInfo, GoogleMap) ->
  WeatherInfo.getAllCitiesWeather (data) ->
    $scope.allcities = data

  $rootScope.getCityData = (name) ->
    GoogleMap.getMapData name, (data) ->
      pos = data[0].geometry.viewport
      GoogleMap.setMapPos "map-canvas", 12,
        lat: pos.Z.d
        lon: pos.fa.b
      , (data) ->
        console.log data



  GoogleMap.setMapPos "map-canvas", 5,
    lat: 39.328404
    lon: -102.128906
  , (data) ->
    console.log data