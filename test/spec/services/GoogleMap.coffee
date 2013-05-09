'use strict'

describe 'Service: GoogleMap', () ->

  # load the service's module
  beforeEach module 'pruebaJorgeherreraApp'

  # instantiate service
  GoogleMap = {}
  beforeEach inject (_GoogleMap_) ->
    GoogleMap = _GoogleMap_

  it 'should exists', () ->
    expect(!!GoogleMap).toBe true;

  it 'should have "getMapData" method', () ->
    expect(!!GoogleMap.getMapData).toBe true;

  it 'should have "setMapPos" method', () ->
    expect(!!GoogleMap.setMapPos).toBe true;