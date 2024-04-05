//
//  Loginview.swift
//  rocketgames
//
//  Created by Brandon Park on 4/5/24.
//

import SwiftUI

struct Loginview: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("rocket-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@email.com", isSecuredField: false)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password, title: "Password", placeholder: "password", isSecuredField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    print("User is logging in!")
                } label: {
                    HStack {
                        Text("Sign In")
                            .textCase(.uppercase)
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                NavigationLink {
                    Registerview()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Register")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    Loginview()
}
