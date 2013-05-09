"use strict"

#Module initialization
WeatherApp = angular.module("pruebaJorgeherreraApp", [])
WeatherApp.config ($routeProvider) ->
  $routeProvider.when("/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  ).when("/city/:city",
    templateUrl: "views/city.html"
    controller: "CityCtrl"
  ).otherwise redirectTo: "/"

WeatherApp.run ($rootScope, $location, $routeParams) ->
  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    city = (if next.params.hasOwnProperty("city") then next.params.city else next.params.city = "")
    $location.path "/"  unless city.match(/(Washington|Los Angeles|Austin)/g)
