//
//  MinMaxView.swift
//  WeatherApp
//
//  Created by Pedro Thomas on 12/12/23.
//

import UIKit

class MinMaxView: UIView {

  // MARK: Properties
  private var minTempText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemBlue, numberOfLines: 1)
  private var minTempImage = ReusableSystemImage(systemImage: "thermometer.sun", preferMultiColor: false, color: .systemBlue)
  var minTempLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .systemBlue, numberOfLines: 1)
  
  private var maxTempText = ReusableLabel(fontSize: 17, weight: .bold, color: .systemRed, numberOfLines: 1)
  private var maxTempImage = ReusableSystemImage(systemImage: "thermometer.sun.fill", preferMultiColor: false, color: .systemRed)
  var maxTempLabel = ReusableLabel(fontSize: 20, weight: .bold, color: .systemRed, numberOfLines: 1)
  
  // MARK: Lifecyle
  override init(frame: CGRect) {
    super.init(frame: .zero)
    //self.translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .gray
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Objc Functions
  
  
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
      minTempText.topAnchor.constraint(equalTo: self.topAnchor),
      minTempText.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      
      minTempImage.topAnchor.constraint(equalTo: minTempText.bottomAnchor, constant: 10),
      minTempImage.centerXAnchor.constraint(equalTo: minTempText.centerXAnchor),
      minTempImage.heightAnchor.constraint(equalToConstant: 40),
      minTempImage.widthAnchor.constraint(equalToConstant: 40),
      
      minTempLabel.topAnchor.constraint(equalTo: minTempImage.bottomAnchor),
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
      maxTempText.topAnchor.constraint(equalTo: self.topAnchor),
      maxTempText.leadingAnchor.constraint(equalTo: minTempText.trailingAnchor, constant: 50),
      
      maxTempImage.topAnchor.constraint(equalTo: maxTempText.bottomAnchor, constant: 10),
      maxTempImage.centerXAnchor.constraint(equalTo: maxTempText.centerXAnchor),
      maxTempImage.heightAnchor.constraint(equalToConstant: 40),
      maxTempImage.widthAnchor.constraint(equalToConstant: 40),
      
      maxTempLabel.topAnchor.constraint(equalTo: maxTempImage.bottomAnchor),
      maxTempLabel.centerXAnchor.constraint(equalTo: maxTempImage.centerXAnchor)
    ])
    
  }
}
