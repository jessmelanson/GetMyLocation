//
//  LocationInfoView.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI
import CoreLocation

struct LocationInfoView: View {
    var body: some View {
        VStack {
            Text("Your Location")
                .font(.title2)
                .padding(.top, 15)
                .padding(.bottom, 5)
            LocationInfoDisplay()
        }
    }
}

struct LocationInfoItem: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .center, spacing: nil) {
            Text("\(label):")
                .bold()
            Text(value)
        }
    }
}

struct LocationInfoDisplay: View {
    @EnvironmentObject var locationManager: CoreLocationManager

    var body: some View {
        if let location = locationManager.userLocation {
            VStack {
                LocationInfoItem(
                    label: "Latitude",
                    value: "\(String(format: "%.3f", abs(location.coordinate.latitude)))°\(location.coordinate.latitude > 0 ? "N" : "S")"
                )
                LocationInfoItem(
                    label: "Longitude",
                    value: "\(String(format: "%.3f", abs(location.coordinate.longitude)))°\(location.coordinate.longitude > 0 ? "E" : "W")"
                )
                LocationInfoItem(label: "Altitude", value: "\(String(format: "%.1f", abs(location.altitude)))m \(location.altitude >= 0 ? "above" : "below") sea level")
            }
                .padding(.bottom, 15)

            // MapView logging some warnings about padding
            // Seems like an issue with iOS 14
            // https://developer.apple.com/forums/thread/652993
            MapView()
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Location not found.")
        }
    }
}

struct LocationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LocationInfoView().environmentObject(CoreLocationManager())
    }
}
