//
//  OnboardingViewModel.swift
//  rocketgames
//
//  Created by Brandon Park on 4/18/24.
//

import Foundation
import Observation

@Observable
class OnboardingViewModel {
    var lifeTotal: Int? = nil
    var totalPlayers: Int? = nil
    var startingPlayer: String
    
    init() {
        self.lifeTotal = nil
        self.totalPlayers = nil
        self.startingPlayer = ""
    }
}
