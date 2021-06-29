//
//  File.swift
//  
//
//  Created by azusa on 2021/6/29.
//

import Foundation
import Vapor
import Fluent

struct Message: Content {
    let device: String
    let env: Environment?
    
    let title: String
    let subtitle: String?
    let body: String?
    
    enum Environment: String, Codable {
        case sandbox
        case production
    }
}

