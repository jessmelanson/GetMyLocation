//
//  SettingsButtonView.swift
//  GetMyLocation
//
//  Created by Melanson, Jessica on 12/14/20.
//

import SwiftUI

struct PermissionNotGrantedView: View {
    var body: some View {
        VStack {
            Text("Permission to access location required for this app to work. Update permissions in settings:")
            Button(action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .foregroundColor(.blue)
                    HStack {
                        Image(systemName: "gear")
                        Text("Set App Permissions")
                    }
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 40, alignment: .center)
            }
        }
        .padding()
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionNotGrantedView()
    }
}
