import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  // Basic "Hello, world!" example
  router.get("hello") { req in
    return "Hello, world!"
  }

  let helloController = HelloController()
  router.get("greet", use: helloController.greet)

  router.get("users", Int.parameter) { req -> String in
    let id = try req.parameters.next(Int.self)
    return "requested id #\(id)"
  }

  // Example of configuring a controller
  let todoController = TodoController()
  router.get("todos", use: todoController.index)
  router.post("todos", use: todoController.create)
  router.delete("todos", Todo.parameter, use: todoController.delete)

  router.post("login") { req -> Future<HTTPStatus> in
    return try req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
      print(loginRequest.email)
      print(loginRequest.password)
      return .ok
    }
  }

  router.get("user") { req -> User in
    return User(name: "Yatin Sarbalia", email: "yatinsns@gmail.com")

  }
}
