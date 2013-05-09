"use strict"
describe "Filter: lowercaseCity", ->
  lowercaseCity = undefined
  beforeEach module("pruebaJorgeherreraApp")
  lowercaseCity = {}
  beforeEach inject(($filter) ->
    lowercaseCity = $filter("lowercaseCity")
  )
  it "should return the input in lowercase without spaces", ->
    text = undefined
    text = "Angular JS"
    expect(lowercaseCity(text)).toBe "angularjs"

