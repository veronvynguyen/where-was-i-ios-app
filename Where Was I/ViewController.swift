//
//  ViewController.swift
//  Where Was I
//
//  Created by Vy Nguyen on 8/20/17.
//  Copyright © 2017 Vy Nguyen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func viewWillAppear(_ animated:Bool) {
        annotateLastLocation()
    }
    
    func annotateLastLocation () {
        if let savedCoord = UserDefaultsDataStore().getLastLocation()
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(savedCoord.latitude)!
            annotation.coordinate.longitude = Double(savedCoord.longitude)!
            annotation.title = "Was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    

    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude {
            if let long = coord?.latitude {
                let lp = LocationPoint(lat: String(lat), long: String(long))
                UserDefaultsDataStore().storeLocationPoint(locationPoint: lp)
            }
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            // make a message box to user to turn on location
            print("location not enabled")
            return
        }
        print("location enabled")
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

