//
//  LocationContentView.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI
import CoreLocation

struct LocationContentView: View {
    @EnvironmentObject var locationManager: CoreLocationManager

    var body: some View {
        if let permissionGranted = locationManager.locationPermissionGranted {
            if permissionGranted {
                LocationInfoView()
            } else {
                PermissionNotGrantedView()
            }
        } else {
            Text("Waiting for user to select location permissions...")
                .padding()
        }
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView()
    }
}
