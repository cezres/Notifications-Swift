//
//  File.swift
//  
//
//  Created by azusa on 2021/6/28.
//

import Foundation
import Fluent
import Vapor
import APNSwift

class NotificationController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("notification") { router in
            router.get("push", use: send)
            router.get("register", use: register)
            router.get("unregister", use: unregister)
        }
    }
    
    let sandboxAPNs: APNSwiftConnection
    let productionAPNs: APNSwiftConnection
    
    init() throws {
        var apnsConfig = try APNSwiftConfiguration(
            authenticationMethod: .jwt(
                key: .private(filePath: Environment.APNs.key),
                keyIdentifier: .init(string: Environment.APNs.keyIdentifier),
                teamIdentifier: Environment.APNs.teamIdentifier
            ),
            topic: Environment.APNs.topic,
            environment: .sandbox
        )
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        
        apnsConfig.environment = .sandbox
        sandboxAPNs = try APNSwiftConnection.connect(configuration: apnsConfig, on: group.next()).wait()
        
        apnsConfig.environment = .production
        productionAPNs = try APNSwiftConnection.connect(configuration: apnsConfig, on: group.next()).wait()
    }
    
    deinit {
        try? sandboxAPNs.close().wait()
        try? productionAPNs.close().wait()
    }
    
    func send(req: Request) throws -> EventLoopFuture<String> {
        let message = try req.query.decode(Message.self)
        let aps = APNSwiftPayload(alert: .init(title: message.title, subtitle: message.subtitle, body: message.body), hasContentAvailable: true)
        let apns = message.env == .sandbox ? sandboxAPNs : productionAPNs
        return apns.send(BasicNotification(aps: aps), pushType: .alert, to: message.device).flatMapAlways { result -> EventLoopFuture<String> in
            switch result {
            case .failure(let error):
                return req.eventLoop.makeFailedFuture(error)
            case .success(_):
                return req.eventLoop.makeSucceededFuture(HTTPStatus.ok.reasonPhrase)
            }
        }
    }
    
    func register(req: Request) throws -> HTTPStatus {
        .ok
    }
    
    func unregister(req: Request) throws -> HTTPStatus {
        .ok
    }
    
}
