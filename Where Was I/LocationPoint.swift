//
//  LocationPoint.swift
//  Where Was I
//
//  Created by Vy Nguyen on 8/21/17.
//  Copyright © 2017 Vy Nguyen. All rights reserved.
//

import Foundation

class LocationPoint
{
    var latitude: String
    var longitude: String
    
    init(lat: String, long: String) {
        self.latitude = lat
        self.longitude = long
    }
}
