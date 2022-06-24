//
//  AppIconsView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct AppIconsView: View {
    @State var icons: [AppIcon] = [
    ]

    var body: some View {
        Form {
            ForEach(icons) {
                Image($0.imageName, bundle: .main)
            }
        }.navigationTitle("App Icons")
    }
}

struct AppIconsView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconsView()
    }
}
