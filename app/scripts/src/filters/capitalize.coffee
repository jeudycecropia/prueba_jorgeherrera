##capitalize filter##
#Filter for capitalize strings
#
# Example: "austin" -> "Austin"
#
WeatherApp.filter "capitalize", ->
  (input) ->
    (if input then input.charAt(0).toUpperCase() + input.slice(1) else input)
