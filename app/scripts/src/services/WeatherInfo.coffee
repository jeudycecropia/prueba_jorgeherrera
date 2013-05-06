##WeatherInfo Service##
#Service for make ajax calls to weather api
#
# 
#
WeatherApp.factory "WeatherInfo", ($http) ->
  allCities = "data/allcities.json"
  cityList =
    Austin: "data/austin.json"
    Washington: "data/washington.json"
    "Los Angeles": "data/la.json"

  #Get information for all the cities
  # params
  # callback -> function
  getAllCitiesWeather: (callback) ->
    $http.get(allCities).success callback


  #Get information for one city
  # params
  # city -> string - callback -> function
  getCityWeather: (city, callback) ->
    $http.get(cityList[city]).success callback
