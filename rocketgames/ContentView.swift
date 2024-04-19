//
//  ContentView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                OnboardingView(onboardingViewModel: OnboardingViewModel())
            } else {
                Loginview()
            }
        }
    }
}

#Preview {
    ContentView(onboardingViewModel: OnboardingViewModel())
}
