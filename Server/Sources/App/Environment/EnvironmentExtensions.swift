//
//  File.swift
//  
//
//  Created by 翟泉 on 2022/7/13.
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
            key = Environment.get("key") ?? "/Users/cezres/Downloads/AuthKey_3728D25F6R.p8"
            keyIdentifier = Environment.get("keyIdentifier") ?? "3728D25F6R"
            teamIdentifier = Environment.get("teamIdentifier") ?? "2T6WKE788U"
            topic = Environment.get("topic") ?? "com.cezres.notifications"
            
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
