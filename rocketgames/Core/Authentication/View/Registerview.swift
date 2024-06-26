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
    @EnvironmentObject var viewModel: AuthViewModel

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
            
            ZStack(alignment: .trailing) {
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecuredField: true)
                
                if (!password.isEmpty && !confirmPassword.isEmpty ) {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemGreen))
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemRed))
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        Button {
            Task {
                try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
            }
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
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1.0 : 0.5)
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

extension Registerview: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        !fullname.isEmpty &&
        password == confirmPassword
    }
}

#Preview {
    Registerview()
}
