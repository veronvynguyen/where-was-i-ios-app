//
//  UserDefaultsDataStore.swift
//  Where Was I
//
//  Created by Vy Nguyen on 8/21/17.
//  Copyright © 2017 Vy Nguyen. All rights reserved.
//

import Foundation

struct StorageKeys
{
    static let storedLat = "latitude"
    static let storedLong = "longitude"
}

class UserDefaultsDataStore
{
    func getDefaults () -> UserDefaults {
        return UserDefaults.standard
    }
    
    func getLastLocation () -> LocationPoint?
    {
        let defaults = getDefaults()
        if let lat = defaults.string(forKey: StorageKeys.storedLat)
        {
            if let long = defaults.string(forKey: StorageKeys.storedLong) {
                return LocationPoint(lat:lat, long: long)
            }
        }
        return nil
    }
    
    func storeLocationPoint (locationPoint: LocationPoint) {
        let defaults = getDefaults()
        
        defaults.setValue(locationPoint.latitude, forKey: StorageKeys.storedLat)
        defaults.setValue(locationPoint.longitude, forKey: StorageKeys.storedLong)
        
        defaults.synchronize()
        print("Stored location point: " + locationPoint.latitude + " :" + locationPoint.longitude)
    }
}
