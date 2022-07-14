import Vapor
import APNSwift

struct NotificationController: RouteCollection {
    
    let apns: APNSClient
    
    init() throws {
        var logger = Logger(label: "com.apnswift")
        logger.logLevel = .info
        
        let authenticationConfig: APNSConfiguration.Authentication = .init(
            privateKey: try .loadFrom(filePath: Environment.APNs.key),
            teamIdentifier: Environment.APNs.teamIdentifier,
            keyIdentifier: Environment.APNs.keyIdentifier
        )
        
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 10)
        
        let apnsConfig = APNSConfiguration(
            authenticationConfig: authenticationConfig,
            topic: Environment.APNs.topic,
            environment: .sandbox,
            eventLoopGroupProvider: .shared(group),
            logger: logger
        )
        
        apns = APNSClient(configuration: apnsConfig)
    }

    func boot(routes: RoutesBuilder) throws {
        routes.group("notification") { builder in
            builder.post("send", use: send)
            builder.get("test", use: test)
        }
    }

    func send(req: Request) async throws -> HTTPStatus {
        let query = try req.query.decode(Notification.self)
        let alert = APNSAlert(
            title: query.title,
            subtitle: query.subtitle,
            body: query.body,
            titleLocKey: nil, titleLocArgs: nil, actionLocKey: nil, locKey: nil, locArgs: nil, launchImage: nil
        )
        let payload = APNSPayload(alert: alert, hasContentAvailable: true)
        try await apns.send(payload, pushType: .alert, to: query.deviceToken, on: query.environment)
        return .ok
    }
    
    func test(req: Request) async throws -> HTTPStatus {
        let aps = APNSPayload(alert: .init(title: "Hey There", subtitle: "Subtitle", body: "Body"), hasContentAvailable: true)
        let deviceToken = "8d6b3e2511ba7fe39b841bd7170ae250c724cbea9d736256df4b53838a5cad87"
        try await apns.send(aps, pushType: .alert, to: deviceToken)
        return .ok
    }
}
