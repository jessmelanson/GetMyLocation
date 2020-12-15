//
//  ContentView.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var locationManager: CoreLocationManager

    var body: some View {
        NavigationView {
            LocationContentView()
                // .navigationTitle() modifier is new to iOS SwiftUI & logs errors about layout constraints
                // seems to be an apple bug as 14.3 released just this week (12/15/20)
                // https://stackoverflow.com/questions/65223457/navigationtitle-aways-creates-an-autolayout-constraint-conflict
                // per the docs .navigationBarTitle is deprecated in favor of .navigationTitle
                .navigationTitle("GetMyLocation")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: {
                    locationManager.requestWhenInUseAuthorization()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
