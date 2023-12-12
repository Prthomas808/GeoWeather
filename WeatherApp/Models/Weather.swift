//
//  Weather.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import Foundation

struct Weather: Codable {
 var coord: CoordinatesResponse
 var main: MainResponse
 var name: String
  //var weather: [weatherResponse]
 var wind: windResponse
}

struct CoordinatesResponse: Codable {
  var lat: Double
  var lon: Double
}

struct MainResponse: Codable {
  var feelsLike: Double
  var humidity: Int
  var pressure: Int
  var temp: Double
  var tempMax: Double
  var tempMin: Double
}

struct weatherResponse: Codable {
  let id: Int
  var main: String
  var description: String
  var icon: String
}

struct windResponse: Codable {
  let speed: Double
//  let deg: Int
//  let gust: Double
}
