//
//  File.swift
//  
//
//  Created by 翟泉 on 2022/7/13.
//

import Foundation
import Vapor
import Fluent
import APNSwift

final class Notification: Content {
    
    var title: String
    
    var subtitle: String?
    
    var body: String?
    
    var deviceToken: String
    
    var environment: APNSConfiguration.Environment?
}

extension APNSConfiguration.Environment: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "production":
            self = .production
        case "sandbox":
            self = .sandbox
        default:
            throw NSError(domain: "unknown environment value", code: -1)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .production:
            try container.encode("production")
        case .sandbox:
            try container.encode("sandbox")
        }
    }
    
}
