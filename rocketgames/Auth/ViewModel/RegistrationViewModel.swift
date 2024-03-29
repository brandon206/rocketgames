//
//  RegistrationViewModel.swift
//  rocketgames
//
//  Created by Brandon Park on 3/28/24.
//

import Foundation
import Observation

@Observable
class RegistrationViewModel {
    var email = ""
    var password = ""
    var showPassword = false
    var passwordCheck = ""
    var showPasswordCheck = false
    
    func validateForm() throws {
        if !email.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 8 || passwordCheck.count < 8 {
            throw AppAuthError.invalidPasswordLength
        } else if password != passwordCheck {
            throw AppAuthError.passwordsDoNotMatch
        }
    }
    
    func registerWithEmail() {
        Task {
            do {
                try validateForm()
                try await AuthService.shared.registerWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
