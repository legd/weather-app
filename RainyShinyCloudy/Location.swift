//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Luis Guzman on 3/24/17.
//  Copyright © 2017 Luis Guzman. All rights reserved.
//

import CoreLocation

/// Location object to be shared during the app execution.
class Location {
    
    /// Latitude value of the location.
    var latitude: Double!
    
    /// Longitude value of the location.
    var longitude: Double!
    
    /// Singleton object for Location class.
    static var sharedInstance = Location()
    
    /// Private initializer for the object.
    private init() {}
}
