//
//  LoginRequest.swift
//  App
//
//  Created by Yatin Sarbalia on 8/25/18.
//

import Vapor

struct LoginRequest: Content {
  var email: String
  var password: String
}
