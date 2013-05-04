##lowercaseCity filter##
#Filter for remove space and lowercase a string
#
# Example: "Los Angeles" -> "losangeles"
#
WeatherApp.filter "lowercaseCity", ->
  (input) ->
    (if input then input.replace(" ", "").toLowerCase() else input)
