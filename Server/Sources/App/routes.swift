import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    Environment.configure()

    try app.register(collection: TodoController())
    try app.register(collection: try NotificationController())
}
