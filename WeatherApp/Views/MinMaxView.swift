//
//  MinMaxView.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import UIKit

class MinMaxView: UIView {

  // MARK: Properties
  private var minTempText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemGray, numberOfLines: 1)
  private var minTempImage = ReusableSystemImage(systemImage: "thermometer.sun", preferMultiColor: false, color: .systemBlue)
  var minTempLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .white, numberOfLines: 1)
  
  private var maxTempText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemGray, numberOfLines: 1)
  private var maxTempImage = ReusableSystemImage(systemImage: "thermometer.sun.fill", preferMultiColor: false, color: .systemRed)
  var maxTempLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .white, numberOfLines: 1)
  
  // MARK: Lifecyle
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Helping Functions
  private func configure() {
    // Minimum Temp Properties
    addSubview(minTempText)
    minTempText.text = "Min Temp"
    minTempText.translatesAutoresizingMaskIntoConstraints = false
    addSubview(minTempImage)
    minTempImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(minTempLabel)
    minTempLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      minTempImage.topAnchor.constraint(equalTo: self.topAnchor),
      minTempImage.heightAnchor.constraint(equalToConstant: 40),
      minTempImage.widthAnchor.constraint(equalToConstant: 40),
      
      minTempText.topAnchor.constraint(equalTo: minTempImage.bottomAnchor, constant: 10),
      minTempText.centerXAnchor.constraint(equalTo: minTempImage.centerXAnchor),
      
      minTempLabel.topAnchor.constraint(equalTo: minTempText.bottomAnchor, constant: 10),
      minTempLabel.centerXAnchor.constraint(equalTo: minTempImage.centerXAnchor)
    ])
    
    // Maximum Temp Properties
    addSubview(maxTempText)
    maxTempText.text = "Max Temp"
    maxTempText.translatesAutoresizingMaskIntoConstraints = false
    addSubview(maxTempImage)
    maxTempImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(maxTempLabel)
    maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      maxTempImage.topAnchor.constraint(equalTo: self.topAnchor),
      maxTempImage.leadingAnchor.constraint(equalTo: minTempImage.trailingAnchor, constant: 100),
      maxTempImage.heightAnchor.constraint(equalToConstant: 40),
      maxTempImage.widthAnchor.constraint(equalToConstant: 40),
      
      maxTempText.topAnchor.constraint(equalTo: maxTempImage.bottomAnchor, constant: 10),
      maxTempText.centerXAnchor.constraint(equalTo: maxTempImage.centerXAnchor),
      
      maxTempLabel.topAnchor.constraint(equalTo: maxTempText.bottomAnchor, constant: 10),
      maxTempLabel.centerXAnchor.constraint(equalTo: maxTempImage.centerXAnchor)
    ])
    
  }
}
