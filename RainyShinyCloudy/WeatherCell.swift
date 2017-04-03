//
//  WeatherCell.swift
//  RainyShinyCloudy
//
//  Created by Luis Guzman on 3/24/17.
//  Copyright © 2017 Luis Guzman. All rights reserved.
//

import UIKit

/// ViewCell model for the forecast table view.
class WeatherCell: UITableViewCell {

    /// List of IBOutlets
    @IBOutlet weak private var weatherIcon: UIImageView!
    @IBOutlet weak private var dayLabel: UILabel!
    @IBOutlet weak private var weatherTypeLabel: UILabel!
    @IBOutlet weak private var highTempLabel: UILabel!
    @IBOutlet weak private var lowTempLabel: UILabel!
 
    /**
        Function for configured the forecast ViewCell.
     
        - Parameter forecast: Forecast model with the data to be displayed in the cell.
    */
    func configureCell(forecast: Forecast) {
        lowTempLabel.text = forecast.lowTemp
        highTempLabel.text = forecast.highTemp
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }

}
