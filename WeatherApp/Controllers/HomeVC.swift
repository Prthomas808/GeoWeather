//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import UIKit

class HomeVC: UIViewController {

  // MARK: Properties
  let cityName = ReusableLabel(fontSize: 30, weight: .bold, color: .systemGreen, numberOfLines: 1)
  let todayLabel = ReusableLabel(fontSize: 50, weight: .bold, color: .label.withAlphaComponent(0.8), numberOfLines: 1)
  let todayDate = ReusableLabel(fontSize: 20, weight: .light, color: .systemGray, numberOfLines: 1)
  let currentWeatherImage = ReusableSystemImage(systemImage: "sun.max.fill", preferMultiColor: true, color: nil)
  let temp = ReusableLabel(fontSize: 60, weight: .bold, color: .label, numberOfLines: 1)

  let minMaxView = MinMaxView()
  let statsView = StatsView()
  
  let weatherService = WeatherManager()
  
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = ""
    fetchWeather()
    setUpCityNameProperties()
    configureTodayView()
    configureCurrentWeatherView()
    configureMinMaxView()
    configureStatsView()
  }
  
  // MARK: Helping Functions
  private func fetchWeather() {
    weatherService.fetchWeather { [weak self] weather in
      DispatchQueue.main.async {
        self?.updateUI(with: weather)
      }
    }
  }
  
  private func updateUI(with weather: Weather?) {
    guard let weather = weather else { return }
    cityName.text = weather.name
    temp.text = "\(Int(weather.main.temp))° F"
    minMaxView.minTempLabel.text = "\(Int(weather.main.tempMin))°"
    minMaxView.maxTempLabel.text = "\(Int(weather.main.tempMax))°"
    statsView.pressureLabel.text = "\(weather.main.pressure) MB"
    statsView.windLabel.text = "\(weather.wind.speed) m/h"
    statsView.humidityLabel.text = "\(weather.main.humidity)%"
  }
  
  private func setUpCityNameProperties() {
    view.addSubview(cityName)
    NSLayoutConstraint.activate([
      cityName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cityName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
      cityName.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func configureTodayView() {
    view.addSubview(todayLabel)
    todayLabel.text = "Today"
    
    view.addSubview(todayDate)
    let date = DateFormatter()
    date.dateStyle = .medium
    let formattedDate = date.string(from: Date())
    todayDate.text = formattedDate
    
    NSLayoutConstraint.activate([
      todayLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 30),
      todayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      todayDate.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 5),
      todayDate.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  private func configureCurrentWeatherView() {
    view.addSubview(currentWeatherImage)
    view.addSubview(temp)
    
    NSLayoutConstraint.activate([
      currentWeatherImage.topAnchor.constraint(equalTo: todayDate.bottomAnchor, constant: 20),
      currentWeatherImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      currentWeatherImage.heightAnchor.constraint(equalToConstant: 200),
      currentWeatherImage.widthAnchor.constraint(equalToConstant: 200),
      
      temp.leadingAnchor.constraint(equalTo: currentWeatherImage.trailingAnchor, constant: 10),
      temp.centerYAnchor.constraint(equalTo: currentWeatherImage.centerYAnchor),
    ])
  }
  
  private func configureMinMaxView() {
    view.addSubview(minMaxView)
    
    NSLayoutConstraint.activate([
      minMaxView.topAnchor.constraint(equalTo: currentWeatherImage.bottomAnchor, constant: 20),
      minMaxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      minMaxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      minMaxView.heightAnchor.constraint(equalToConstant: 125),
    ])
  }
  
  private func configureStatsView() {
    view.addSubview(statsView)
    
    NSLayoutConstraint.activate([
      statsView.topAnchor.constraint(equalTo: minMaxView.bottomAnchor),
      statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
      statsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
}
