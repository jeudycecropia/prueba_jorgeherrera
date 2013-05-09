##CityCtrl##
#Controller for the city pages
#
#
#
WeatherApp.controller "CityCtrl", ($scope, $rootScope, $routeParams, WeatherInfo, GoogleMap) ->
  $scope.city = $routeParams.city
  
  WeatherInfo.getCityWeather $routeParams.city, (data) ->
    getCityData data.location
    $scope.cityStats = data

  getCityData = (name) ->
    GoogleMap.getMapData name, (data) ->
      pos = data[0].geometry.viewport
      GoogleMap.setMapPos "map-canvas", 12,
        lat: pos.fa.d
        lon: pos.ia.d
      , (data) ->
        console.log data

  GoogleMap.setMapPos "map-canvas", 4,
    lat: 39.328404
    lon: -102.128906
  , (data) ->
    console.log data

  navList = document.querySelectorAll(".nav li")
  i = 0
  len = navList.length

  while i < len
    navList[i].classList.remove "active"
    i++
  document.querySelector("." + $routeParams.city.replace(" ", "").toLowerCase()).classList.add "active"
