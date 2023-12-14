//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import UIKit
import CoreLocation

class HomeVC: UIViewController {

  // MARK: Properties
  let mainView = MainView()
  let minMaxView = MinMaxView()
  let pressureWindHumidityiew = pressureWindHumidityView()
  
  var weatherService = WeatherManager()
  
  let locationManager = CLLocationManager()
  var currentLocation: CLLocation?
  
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    configureMainView()
    configureWeatherStats()
    fetchWeather()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupLocation()
  }
  
  // MARK: Helping Functions
  private func fetchWeather() {
    requestWeatherForLocation()
  }
  
  private func updateUI(with weather: Weather?) {
    guard let weather = weather else { return }
    mainView.cityName.text = weather.name
    mainView.currentWeatherImage.image = UIImage(systemName: setUpWeatherImage(icon: weather.weather[0].icon))
    mainView.temp.text = "\(Int(weather.main.temp))° F"
    mainView.weatherDescription.text = weather.weather[0].description
    minMaxView.minTempLabel.text = "\(Int(weather.main.tempMin))°"
    minMaxView.maxTempLabel.text = "\(Int(weather.main.tempMax))°"
    pressureWindHumidityiew.pressureLabel.text = "\(weather.main.pressure) MB"
    pressureWindHumidityiew.windLabel.text = "\(Int(weather.wind.speed)) m/h"
    pressureWindHumidityiew.humidityLabel.text = "\(weather.main.humidity)%"
  }
  
  private func configureMainView() {
    view.addSubview(mainView)
    NSLayoutConstraint.activate([
      mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  private func configureWeatherStats() {
    view.addSubview(minMaxView)
    NSLayoutConstraint.activate([
      minMaxView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 175),
      minMaxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      minMaxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      minMaxView.heightAnchor.constraint(equalToConstant: 125),
    ])
    
    view.addSubview(pressureWindHumidityiew)
    NSLayoutConstraint.activate([
      pressureWindHumidityiew.topAnchor.constraint(equalTo: minMaxView.bottomAnchor),
      pressureWindHumidityiew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
      pressureWindHumidityiew.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
}

extension HomeVC: CLLocationManagerDelegate {
  func setupLocation() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if !locations.isEmpty, currentLocation == nil {
      currentLocation = locations.first
      locationManager.stopUpdatingLocation()
      requestWeatherForLocation()
    }
  }
  
  func requestWeatherForLocation() {
    guard let long = currentLocation?.coordinate.longitude else { return }
    guard let lat = currentLocation?.coordinate.latitude else { return }
    
    weatherService.fetchWeather(lat: lat, long: long) { [weak self] weather in
          DispatchQueue.main.async {
              self?.updateUI(with: weather)
          }
      }
  }
}

extension HomeVC {
  private func setUpWeatherImage(icon: String) -> String {
    var systemImage = ""
    
    switch icon {
    case "01d": systemImage = "sun.max.fill"
    case "01n": systemImage = "moon.fill"
    case "02d": systemImage = "cloud.sun.fill"
    case "02n": systemImage = "cloud.moon.fill"
    case "03d", "03n", "04d", "04n": systemImage = "cloud.fill"
    case "09d", "09n", "10d", "10n": systemImage = "cloud.rain.fill"
    case "11d", "11n": systemImage = "cloud.bolt.rain.fill"
    case "13d", "13n": systemImage = "snow"
    case "50d", "50n": systemImage = "cloud.fog"
    default: systemImage = ""
    }
    
    return systemImage
  }
}
