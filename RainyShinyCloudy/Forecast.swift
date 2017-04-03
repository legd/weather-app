//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Luis Guzman on 3/24/17.
//  Copyright © 2017 Luis Guzman. All rights reserved.
//

import UIKit
import Alamofire

/// Weather forecast model class.
class Forecast {
    
    /// Date for the weather forecast.
    private var _date: String!
    
    /// Weather type for the forecast.
    private var _weatherType: String!
    
    /// Maximum temperature for the forecast.
    private var _highTemp: String!
    
    /// Minimum temperature for the forecast.
    private var _lowTemp: String!
    
    /// Computed property for the date, if is it nil returns an empty String.
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    /// Computed property for weatherType, if is it nil returns an empty String.
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    /// Computed property for the highTemp, if is it nil returns an empty String.
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    /// Computed property for the lowTemp, if is it nil returns an empty String.
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    /**
        Initializes a new forecast from a parsed JSON dictionary.
     
        - Parameter weatherDict: JSON dictionary to be parsed.
    */
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                let kelvinToCelsius = min - KELVIN_TO_CELSIUS_CONSTANT
                
                self._lowTemp = "\(round(kelvinToCelsius))°"
            }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToCelsius = max - KELVIN_TO_CELSIUS_CONSTANT
                
                self._highTemp = "\(round(kelvinToCelsius))°"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

/// Date class extension to improve the day presentation from a Date object.
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
