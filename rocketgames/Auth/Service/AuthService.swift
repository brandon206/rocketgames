//
//  AuthService.swift
//  rocketgames
//
//  Created by Brandon Park on 3/24/24.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService {
    var currentUser: FirebaseAuth.User?
    
    private let auth = Auth.auth()
    
    static let shared = AuthService()
    
    private init () {
        currentUser = auth.currentUser
    }
    
    func registerWithEmail(email: String, password: String) async throws {
        let result = try await auth.createUser(withEmail: email, password: password)
        currentUser = result.user
        print(result.user)
    }
    
    func signInWithEmail(email: String, password: String) async throws {
        let result = try await auth.signIn(withEmail: email, password: password)
        currentUser = result.user
        print(result.user)
    }
    
    func signOut() throws {
        try auth.signOut()
        currentUser = nil
    }
}
