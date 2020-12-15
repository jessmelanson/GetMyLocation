//
//  CoreLocationManager.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import Foundation
import CoreLocation
import MapKit

final class CoreLocationManager: CLLocationManager, ObservableObject {
    @Published var userLocation: CLLocation?
    @Published var mapCoordinateRegion = MKCoordinateRegion()
    @Published var locationPermissionGranted: Bool?

    override init() {
        super.init()
        self.delegate = self
        self.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.mapCoordinateRegion.span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    }
}

extension CoreLocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized")
            self.locationPermissionGranted = true
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("Permission not given")
            self.locationPermissionGranted = false
        case .notDetermined:
            print("User has not yet been prompted for location permission")
            self.locationPermissionGranted = nil
        // covers future additions
        default:
            print("Something went wrong. Try again.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let mostRecentLocation = locations.last {
            self.userLocation = mostRecentLocation
            self.mapCoordinateRegion.center = mostRecentLocation.coordinate
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")
    }
}
