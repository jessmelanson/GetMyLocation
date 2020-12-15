//
//  GetMyLocationApp.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI

@main
struct GetMyLocationApp: App {
    let locationManager = CoreLocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
