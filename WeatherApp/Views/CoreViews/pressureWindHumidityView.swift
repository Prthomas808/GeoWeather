//
//  pressureWindHumidityView.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/13/23.
//

import UIKit

class pressureWindHumidityView: UIView {

  // MARK: Properties
  private var pressureText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemGray, numberOfLines: 1)
  private var pressureImage = ReusableSystemImage(systemImage: "speedometer", preferMultiColor: false, color: .systemTeal)
  var pressureLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .white, numberOfLines: 1)
  
  private var windText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemGray, numberOfLines: 1)
  private var windImage = ReusableSystemImage(systemImage: "wind", preferMultiColor: false, color: .systemOrange)
  var windLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .white, numberOfLines: 1)
  
  private var humidityText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemGray, numberOfLines: 1)
  private var humidityImage = ReusableSystemImage(systemImage: "humidity.fill", preferMultiColor: false, color: .systemPurple)
  var humidityLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .white, numberOfLines: 1)
  
  
  // MARK: Lifecyle
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Helping Functions
  private func configure() {
    // Pressure Properties
    addSubview(pressureImage)
    pressureImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(pressureText)
    pressureText.text = "Pressure"
    pressureText.translatesAutoresizingMaskIntoConstraints = false
    addSubview(pressureLabel)
    pressureLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      pressureImage.topAnchor.constraint(equalTo: self.topAnchor),
      pressureImage.heightAnchor.constraint(equalToConstant: 40),
      pressureImage.widthAnchor.constraint(equalToConstant: 40),
      
      pressureText.topAnchor.constraint(equalTo: pressureImage.bottomAnchor, constant: 10),
      pressureText.centerXAnchor.constraint(equalTo: pressureImage.centerXAnchor),
      
      pressureLabel.topAnchor.constraint(equalTo: pressureText.bottomAnchor, constant: 10),
      pressureLabel.centerXAnchor.constraint(equalTo: pressureImage.centerXAnchor)
    ])
    
    // Wind Properties
    addSubview(windImage)
    windImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(windText)
    windText.text = "Wind"
    windText.translatesAutoresizingMaskIntoConstraints = false
    addSubview(windLabel)
    windLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      windImage.topAnchor.constraint(equalTo: self.topAnchor),
      windImage.leadingAnchor.constraint(equalTo: pressureImage.trailingAnchor, constant: 100),
      windImage.heightAnchor.constraint(equalToConstant: 40),
      windImage.widthAnchor.constraint(equalToConstant: 40),
      
      windText.topAnchor.constraint(equalTo: windImage.bottomAnchor, constant: 10),
      windText.centerXAnchor.constraint(equalTo: windImage.centerXAnchor),
      
      windLabel.topAnchor.constraint(equalTo: windText.bottomAnchor, constant: 10),
      windLabel.centerXAnchor.constraint(equalTo: windImage.centerXAnchor)
    ])
    
    // Humidity Properties
    addSubview(humidityImage)
    humidityImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(humidityText)
    humidityText.text = "Humidity"
    humidityText.translatesAutoresizingMaskIntoConstraints = false
    addSubview(humidityLabel)
    humidityLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      humidityImage.topAnchor.constraint(equalTo: self.topAnchor),
      humidityImage.leadingAnchor.constraint(equalTo: windImage.trailingAnchor, constant: 100),
      humidityImage.heightAnchor.constraint(equalToConstant: 40),
      humidityImage.widthAnchor.constraint(equalToConstant: 40),
      
      humidityText.topAnchor.constraint(equalTo: humidityImage.bottomAnchor, constant: 10),
      humidityText.centerXAnchor.constraint(equalTo: humidityImage.centerXAnchor),
      
      humidityLabel.topAnchor.constraint(equalTo: humidityText.bottomAnchor, constant: 10),
      humidityLabel.centerXAnchor.constraint(equalTo: humidityImage.centerXAnchor)
    ])
  }
}
