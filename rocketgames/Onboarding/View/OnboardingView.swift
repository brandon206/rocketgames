//
//  OnboardingView.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showFullScreen = true
    var onboardingViewModel: OnboardingViewModel
//    @State private var lifeTotal = nil
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    Image("rocket-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 120)
                        .padding(.vertical, 32)
                    
                    VStack {
                        NavigationLink(value: "StartGameView") {
                            Text("Start Game")
                        }
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.orange)
                        .navigationDestination(for: String.self) { view in
                            if view == "StartGameView" {
                                StartGameView(onboardingViewModel: OnboardingViewModel())
                            }
                        }
                        
                        NavigationLink(value: "ProfileView") {
                            Text("Settings")
                        }
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray)
                        .navigationDestination(for: String.self) { view in
                            if view == "ProfileView" {
                                ProfileView()
                            }
                        }
                    }.padding(50)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnboardingView(onboardingViewModel: OnboardingViewModel())
}
