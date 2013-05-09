"use strict"
describe "Filter: capitalize", ->
  capitalize = undefined
  beforeEach module("pruebaJorgeherreraApp")
  capitalize = {}
  beforeEach inject(($filter) ->
    capitalize = $filter("capitalize")
  )
  it "should return the input with the first letter capilized", ->
    text = undefined
    text = "angularjs"
    expect(capitalize(text)).toBe "Angularjs"

