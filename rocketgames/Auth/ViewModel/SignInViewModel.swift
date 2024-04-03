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
    case passwordsDoNotMatch
}

@Observable
class SignInViewModel {
    var email = ""
    var password = ""
    var resetPasswordEmail = ""
    var showPassword = false
    var showRegistration = false
    var showResetPassword = false
    
    func validateSignInForm() throws {
        if !email.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 8 {
            throw AppAuthError.invalidPasswordLength
        }
    }
    
    func validateResetPassword() throws {
        if !resetPasswordEmail.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 8 {
            throw AppAuthError.invalidPasswordLength
        }
    }
    
    func signInWithEmail() {
        Task {
            do {
                try validateSignInForm()
                try await AuthService.shared.signInWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func resetPassword() {
        Task {
            do {
                try validateResetPassword()
                try await AuthService.shared.resetPassword(email: resetPasswordEmail)
                showResetPassword = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
