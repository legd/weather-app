//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Luis Guzman on 3/23/17.
//  Copyright © 2017 Luis Guzman. All rights reserved.
//

import UIKit
import Alamofire

/// CurrentWeather model class.
class CurrentWeather {
    
    /// Name of city for the current weather.
    private var _cityName: String!
    
    /// Date for the current weather.
    private var _date: String!
    
    /// Weather type.
    private var _weatherType: String!
    
    /// Temperature for the current weather.
    private var _currentTemp: Double!
    
    /// Computed property for the cityName, if is it nil returns an empty String.
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    /// Computed property for the date, if is it nil returns the current date.
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    /// Computed property for the weatherType, if is it nil returns an empty String.
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    /// Computed property for the currentTemp, if is it nil returns 0.0.
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    /**
        Download the weather details for the current day and user location in JSON format, then parsed the JSON.
     
        - Parameter completed: Function to be called after the download completion.
    */
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamofire download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        // Conversion from Kelvin to Celsius
                        let kelvinToCelsius = currentTemperature - KELVIN_TO_CELSIUS_CONSTANT
                        
                        self._currentTemp = round(kelvinToCelsius)
                    }
                }
            }
            completed()
        }
        
    }
}
