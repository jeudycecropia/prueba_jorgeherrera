##MainCtrl##
#Controller for the home page
#
#
#
WeatherApp.controller "MainCtrl", ($scope, $rootScope, $http, WeatherInfo, GoogleMap) ->
  WeatherInfo.getAllCitiesWeather (data) ->
    $scope.allcities = data

  GoogleMap.setMapPos "map-canvas", 5,
    lat: 39.328404
    lon: -102.128906
  , (data) ->
    console.log data