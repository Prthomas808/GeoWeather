//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import Foundation
import CoreLocation

class WeatherManager {
  static let shared = WeatherManager()
  
  let apiKey = "d6f2aae2862f75591152761eb594831c"
  
  func fetchWeather(lat: Double, long: Double, completion: @escaping (Weather?) -> Void) {
    
      let endpoint = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(self.apiKey)&units=imperial"
//      let endpoint = "https://api.openweathermap.org/data/2.5/weather?lat=41.88&lon=-87.62&appid=\(apiKey)&units=imperial"
      
      
      guard let url = URL(string: endpoint) else {
        print("DEBUG: Error accesing URL")
        return
      }
      
      
      
      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print(error.localizedDescription)
          return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
          print("There was a response error")
          return
        }
        
        guard let data = data else {
          print("There was an error accessing the data")
          return
        }
        
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let weather = try decoder.decode(Weather.self, from: data)
          completion(weather)
          //        let results = try JSONSerialization.jsonObject(with: data)
          //        print(results)
        } catch {
          print(error.localizedDescription)
        }
      }
      
      task.resume()
    }
  
}
