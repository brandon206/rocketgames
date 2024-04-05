//
//  Registerview.swift
//  rocketgames
//
//  Created by Brandon Park on 4/5/24.
//

import SwiftUI

struct Registerview: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("rocket-logo")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .padding(.vertical, 32)
        }
        
        VStack(spacing: 24) {
            InputView(text: $email, title: "Email Address", placeholder: "name@email.com", isSecuredField: false)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name", isSecuredField: false)
            
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecuredField: true)
            
            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecuredField: true)
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        Button {
            print("Signing Up!")
        } label: {
            HStack {
                Text("Sign Up")
                    .textCase(.uppercase)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemOrange))
        .cornerRadius(10)
        .padding(.top, 24)
        
        Spacer()
        
        Button(action: {
            dismiss()
        }, label: {
            Text("Already have an account?")
            Text("Sign In")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        })
        .font(.system(size: 14))
    }
    
}

#Preview {
    Registerview()
}
