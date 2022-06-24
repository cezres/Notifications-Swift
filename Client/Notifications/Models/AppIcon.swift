//
//  AppIcon.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import Foundation

struct AppIcon: Identifiable {
    let imageName: String
    
    var id: String {
        imageName
    }
}
