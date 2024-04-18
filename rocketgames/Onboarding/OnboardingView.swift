//
//  OnboardingView.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink(value: "StartGameView") {
                    Text("Start Game")
                }
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .navigationDestination(for: String.self) { view in
                    if view == "StartGameView" {
                        StartGameView()
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
            }
        }
        .padding(50)
    }
}

#Preview {
    OnboardingView()
}
