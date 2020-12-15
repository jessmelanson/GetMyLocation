//
//  MapView.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationManager: CoreLocationManager

    var body: some View {
        Map(coordinateRegion: $locationManager.mapCoordinateRegion)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
