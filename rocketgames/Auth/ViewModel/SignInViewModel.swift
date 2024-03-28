//
//  SignInViewModel.swift
//  rocketgames
//
//  Created by Brandon Park on 3/24/24.
//

import Foundation
import Observation

enum AppAuthError: Error {
    case invalidEmail
    case invalidPasswordLength
}

@Observable
class SignInViewModel {
    var email = ""
    var password = ""
    var showPassword = false
    var showRegistration = false
    
    func validateForm() throws {
        if !email.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 8 {
            throw AppAuthError.invalidPasswordLength
        }
    }
    
    func signInWithEmail() {
        Task {
            do {
                try validateForm()
                try await AuthService.shared.signInWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
