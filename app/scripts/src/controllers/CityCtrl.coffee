##CityCtrl##
#Controller for the city pages
#
#
#
WeatherApp.controller "CityCtrl", ($scope, $rootScope, $routeParams, WeatherInfo, GoogleMap) ->
  $scope.city = $routeParams.city
  WeatherInfo.getCityWeather $routeParams.city, (data) ->
    $scope.cityStats = data

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
