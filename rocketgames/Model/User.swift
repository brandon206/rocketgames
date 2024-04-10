//
//  User.swift
//  rocketgames
//
//  Created by Brandon Park on 4/5/24.
//

import Foundation
struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Chris Rock", email: "chris.rock@rocket.com")
                                
}
