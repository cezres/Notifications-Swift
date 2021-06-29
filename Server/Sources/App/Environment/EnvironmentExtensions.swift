//
//  File.swift
//  
//
//  Created by azusa on 2021/6/29.
//

import Foundation
import Vapor

extension Environment {
    static func configure() {
        APNs.configure()
    }
    
    struct APNs: Codable {
        private(set) static var key: String = ""
        private(set) static var keyIdentifier: String = ""
        private(set) static var teamIdentifier: String = ""
        private(set) static var topic: String = ""
        
        fileprivate static func configure() {
            key = Environment.get("key") ?? "/Users/azusa/Documents/AuthKey_867KZV9V3U.p8"
            keyIdentifier = Environment.get("keyIdentifier") ?? "867KZV9V3U"
            teamIdentifier = Environment.get("teamIdentifier") ?? "2T6WKE788U"
            topic = Environment.get("topic") ?? "com.cezres.notification"
            
            print("""
            Environment.APNs:
                key: \(key)
                keyIdentifier: \(keyIdentifier)
                teamIdentifier: \(teamIdentifier)
                topic: \(topic)
            """)
        }
    }
}
