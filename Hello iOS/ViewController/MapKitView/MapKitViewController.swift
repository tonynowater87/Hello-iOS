//
//  MapKitViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/23.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var labelLatLng: UILabel!
    
    let latitude = CLLocationDegrees.init(37.785834)
    let longitude = CLLocationDegrees.init(-122.406417)
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        mapView.showsUserLocation = true
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    override func viewDidAppear(_ animated: Bool) {
        mapView.setCenter(CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude), animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.first!
        labelLatLng.text = "\(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location manager error:\(error)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
