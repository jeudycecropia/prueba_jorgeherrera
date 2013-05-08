(function () {
  'use strict';
  var WeatherApp;
  WeatherApp = angular.module('pruebaJorgeherreraApp', []);
  WeatherApp.config([
    '$routeProvider',
    function ($routeProvider) {
      return $routeProvider.when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      }).when('/city/:city', {
        templateUrl: 'views/city.html',
        controller: 'CityCtrl'
      }).otherwise({ redirectTo: '/' });
    }
  ]);

  WeatherApp.run(function($rootScope, $location, $routeParams){
    $rootScope.$on('$routeChangeStart', function(event, next, current, $rootScope){
      var city = next.params.hasOwnProperty('city') ? next.params.city : next.params.city = '';
      if(!city.match(/(Washington|Los Angeles|Austin)/gi))
        $location.path('/');
    })
  });

  WeatherApp.controller('CityCtrl', [
    '$scope',
    '$rootScope',
    '$routeParams',
    'WeatherInfo',
    'GoogleMap',
    function ($scope, $rootScope, $routeParams, WeatherInfo, GoogleMap) {
      var i, len, navList;
      $scope.city = $routeParams.city;
      WeatherInfo.getCityWeather($routeParams.city, function (data) {
        getCityData(data.location);
        return $scope.cityStats = data;
      });
      function getCityData(name) {
        return GoogleMap.getMapData(name, function (data) {
          var pos;
          pos = data[0].geometry.viewport;
          return GoogleMap.setMapPos('map-canvas', 12, {
            lat: pos.fa.d,
            lon: pos.ia.d
          }, function (data) {
            return console.log(data);
          });
        });
      };
      navList = document.querySelectorAll('.nav li');
      i = 0;
      len = navList.length;
      while (i < len) {
        navList[i].classList.remove('active');
        i++;
      }
      return document.querySelector('.' + $routeParams.city.replace(' ', '').toLowerCase()).classList.add('active');
    }
  ]);
  WeatherApp.controller('MainCtrl', [
    '$scope',
    '$rootScope',
    '$http',
    'WeatherInfo',
    'GoogleMap',
    function ($scope, $rootScope, $http, WeatherInfo, GoogleMap) {
      WeatherInfo.getAllCitiesWeather(function (data) {
        return $scope.allcities = data;
      });
      return GoogleMap.setMapPos('map-canvas', 5, {
        lat: 39.328404,
        lon: -102.128906
      }, function (data) {
        return console.log(data);
      });
    }
  ]);
  WeatherApp.filter('capitalize', function () {
    return function (input) {
      if (input) {
        return input.charAt(0).toUpperCase() + input.slice(1);
      } else {
        return input;
      }
    };
  });
  WeatherApp.filter('lowercaseCity', function () {
    return function (input) {
      if (input) {
        return input.replace(' ', '').toLowerCase();
      } else {
        return input;
      }
    };
  });
  WeatherApp.factory('GoogleMap', [
    '$http',
    function ($http) {
      return {
        getMapData: function (name, callback) {
          var geoco;
          geoco = new google.maps.Geocoder();
          return geoco.geocode({ address: name }, callback);
        },
        setMapPos: function (canvasId, zoom, coord, callback) {
          var getMap, map, mapOptions;
          getMap = function () {
            var map, marker;
            if (document.getElementById(canvasId)) {
              map = new google.maps.Map(document.getElementById(canvasId), mapOptions);
              marker = new google.maps.Marker({
                position: new google.maps.LatLng(coord.lat, coord.lon),
                animation: google.maps.Animation.DROP,
                title: name
              });
              return marker.setMap(map);
            } else {
              return setTimeout(getMap, 500);
            }
          };
          map = void 0;
          mapOptions = {
            zoom: zoom,
            center: new google.maps.LatLng(coord.lat, coord.lon),
            scrollwheel: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          return getMap();
        }
      };
    }
  ]);
  WeatherApp.factory('WeatherInfo', [
    '$http',
    function ($http) {
      var allCities, cityList;
      allCities = 'data/allcities.json';
      cityList = {
        Austin: 'data/austin.json',
        Washington: 'data/washington.json',
        'Los Angeles': 'data/la.json'
      };
      return {
        getAllCitiesWeather: function (callback) {
          return $http.get(allCities).success(callback);
        },
        getCityWeather: function (city, callback) {
          return $http.get(cityList[city]).success(callback);
        }
      };
    }
  ]);
}.call(this));