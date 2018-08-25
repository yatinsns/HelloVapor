//
//  HelloController.swift
//  HelloVaporPackageDescription
//
//  Created by Yatin Sarbalia on 8/25/18.
//

import Vapor

final class HelloController {
  func greet(_ req: Request) throws -> String {
    //return try req.make(BCryptHasher.self).hash("hello Yatin")
    return "Hello Yatin"
  }
}
