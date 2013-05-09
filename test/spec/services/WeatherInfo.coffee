'use strict'

describe 'Service: WeatherInfo', () ->

  # load the service's module
  beforeEach module 'pruebaJorgeherreraApp'

  # instantiate service
  WeatherInfo = {}
  beforeEach inject (_WeatherInfo_) ->
    WeatherInfo = _WeatherInfo_

  it 'should exists', () ->
    expect(!!WeatherInfo).toBe true;

  it 'should have "getAllCitiesWeather" method', () ->
    expect(!!WeatherInfo.getAllCitiesWeather).toBe true;

  it 'should have "getCityWeather" method', () ->
    expect(!!WeatherInfo.getCityWeather).toBe true;