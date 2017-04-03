//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Luis Guzman on 3/23/17.
//  Copyright © 2017 Luis Guzman. All rights reserved.
//

/// A file with all the constants needed by the application.
import Foundation

/// Number of days for the Forecast.
let NUMBER_OF_DAYS = 10

/// Constant value used to convert from Kelvin to Celsius.
let KELVIN_TO_CELSIUS_CONSTANT = 273.15

/// API URLs.
let BASE_URL = "http://api.openweathermap.org/data/2.5"
let CURRENT_WEATHER = "/weather?"
let FORECAST = "/forecast/daily?"

/// API parameters name String.
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let FORECAST_DAYS = "&cnt=\(NUMBER_OF_DAYS)"
let APP_ID = "&appid="

/// API Key.
let API_KEY = "df0124d1f79e29fb62787397dae90ab8"

/// URL for the current weather.
let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT_WEATHER)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

/// URL for the forecast.
let FORECAST_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(FORECAST_DAYS)\(APP_ID)\(API_KEY)"

/// Typealias for a function
typealias DownloadComplete = () -> ()

