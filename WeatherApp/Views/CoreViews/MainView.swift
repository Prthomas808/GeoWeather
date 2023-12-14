//
//  MainView.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/14/23.
//

import UIKit

class MainView: UIView {

  // MARK: Properties
  let cityName = ReusableLabel(fontSize: 30, weight: .bold, color: .systemIndigo, numberOfLines: 1)
  let todayLabel = ReusableLabel(fontSize: 50, weight: .bold, color: .white, numberOfLines: 1)
  let todayDate = ReusableLabel(fontSize: 20, weight: .light, color: .systemGray, numberOfLines: 1)
  let currentWeatherImage = ReusableSystemImage(systemImage: "", preferMultiColor: true, color: nil)
  let temp = ReusableLabel(fontSize: 60, weight: .bold, color: .white, numberOfLines: 1)
  let weatherDescription = ReusableLabel(fontSize: 18, weight: .light, color: .gray, numberOfLines: 1)
  
  // MARK: Lifecyle
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: Objc Functions
  
  
  // MARK: Helping Functions
  private func configure() {
    setUpCityNameProperties()
    configureTodayView()
    configureCurrentWeatherView()
  }
  
  private func setUpCityNameProperties() {
    addSubview(cityName)
    NSLayoutConstraint.activate([
      cityName.centerXAnchor.constraint(equalTo: centerXAnchor),
      cityName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -20),
      cityName.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func configureTodayView() {
    addSubview(todayLabel)
    todayLabel.text = "Today"
    
    addSubview(todayDate)
    let date = DateFormatter()
    date.dateStyle = .medium
    let formattedDate = date.string(from: Date())
    todayDate.text = formattedDate
    
    NSLayoutConstraint.activate([
      todayLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 30),
      todayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      todayDate.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 5),
      todayDate.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  private func configureCurrentWeatherView() {
    addSubview(currentWeatherImage)
    currentWeatherImage.contentMode = .scaleAspectFit
    addSubview(temp)
    addSubview(weatherDescription)
    
    NSLayoutConstraint.activate([
      currentWeatherImage.topAnchor.constraint(equalTo: todayDate.bottomAnchor, constant: 20),
      currentWeatherImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      currentWeatherImage.heightAnchor.constraint(equalToConstant: 200),
      currentWeatherImage.widthAnchor.constraint(equalToConstant: 200),
      
      temp.leadingAnchor.constraint(equalTo: currentWeatherImage.trailingAnchor, constant: 10),
      temp.centerYAnchor.constraint(equalTo: currentWeatherImage.centerYAnchor, constant: -10),
      
      weatherDescription.topAnchor.constraint(equalTo: temp.bottomAnchor),
      weatherDescription.leadingAnchor.constraint(equalTo: currentWeatherImage.trailingAnchor, constant: 10)
    ])
  }
  


}
