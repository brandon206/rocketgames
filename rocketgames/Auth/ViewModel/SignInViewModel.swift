//
//  SignInViewModel.swift
//  rocketgames
//
//  Created by Brandon Park on 3/24/24.
//

import Foundation
import Observation

@Observable
class SignInViewModel {
    var email = ""
    var password = ""
    var showPassword = false
    
    func signInWithEmail() {
        Task {
            do {
                try await AuthService.shared.signInWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
