//
//  SignInView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/19/24.
//

import SwiftUI

struct SignInView: View {
    @State var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                RocketGamesTextField(placeholder: "Email", text: $viewModel.email)
                RocketGamesSecureField(placeholder: "Password", showPassword: $viewModel.showPassword, text: $viewModel.password)
                Button("Forgot Password") {
                    
                }.bold().padding(.top)
                    .foregroundColor(Color("AppColor"))
                
                Button() {
                    viewModel.signInWithEmail()
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("AppColor"))
                        )
                }
            }
            .padding()
            
            Spacer()
            
            VStack(spacing: 24) {
                Text("Don't have an account yet?")
                    .foregroundColor(Color("AppColor"))
                Button() {
                    viewModel.showRegistration = true
                } label: {
                    Text("Register")
                        .foregroundColor(Color("AppColor"))
                        .padding()
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("AppColor"))
                        )
                }
            }
            .padding()
            .padding(.bottom)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .sheet(isPresented: $viewModel.showRegistration, content: {
            HomeView()
        })
    }
}

#Preview {
    SignInView()
}
