//
//  StartGameView.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

struct StartGameView: View {
//    @Binding var lifeTotal = nil
    var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Set Life Total")
                .font(.title)
                .bold()
            
            //        TODO: add logic for starting life total buttons
            HStack {
                Button("10", action: {
                    onboardingViewModel.lifeTotal = 10
                    print("life total is: ", onboardingViewModel.lifeTotal)
                })
                .font(.headline)
                .padding(.vertical, 30)
                .padding(.horizontal, 30)
                .foregroundStyle(Color.white)
                .background(Color.orange)
                .cornerRadius(5)
                
                Spacer()
                
                Button("20", action: {
                    onboardingViewModel.lifeTotal = 20
                    print("life total is: ", onboardingViewModel.lifeTotal)
                })
                .font(.headline)
                .padding(.vertical, 30)
                .padding(.horizontal, 30)
                .foregroundStyle(Color.white)
                .background(Color.orange)
                .cornerRadius(5)
                
                Spacer()
                
                Button("40", action: {
                    onboardingViewModel.lifeTotal = 40
                    print("life total is: ", onboardingViewModel.lifeTotal)
                })
                .font(.headline)
                .padding(.vertical, 30)
                .padding(.horizontal, 30)
                .foregroundStyle(Color.white)
                .background(Color.orange)
                .cornerRadius(5)
            }
            .padding(.vertical, 50)
            
            HStack {
//                TODO: update custom to popup a sheet or modal
                Button("Custom", action: {
                    onboardingViewModel.lifeTotal = 100
                    print("life total is: ", onboardingViewModel.lifeTotal)
                })
                .font(.headline)
                .padding(.vertical, 30)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.orange)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.orange, lineWidth: 1)
                )
            }
            
            Spacer()
            
            HStack {
                CustomNavigationButton(type: .previous, action: {})
                Spacer()
                CustomNavigationButton(type: .next, action: {})
            }
            .padding(.vertical, 50)
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.horizontal, 50)
    }
}

#Preview {
    StartGameView(onboardingViewModel: OnboardingViewModel())
}
