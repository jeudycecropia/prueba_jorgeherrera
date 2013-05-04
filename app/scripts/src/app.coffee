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
