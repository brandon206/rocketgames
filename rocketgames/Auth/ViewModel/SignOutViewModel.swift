//
//  SignOutViewModel.swift
//  rocketgames
//
//  Created by Brandon Park on 3/27/24.
//

import Foundation
import Observation

@Observable
class SignOutViewModel {
    func signOut() {
        Task {
            do {
                try AuthService.shared.signOut()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
