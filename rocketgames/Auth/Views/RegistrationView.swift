//
//  RegistrationView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/28/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = RegistrationViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Register Now")
                    .font(.title)
                    .bold()
                Spacer()
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(Color(uiColor: .label))
                }
            }
            RocketGamesTextField(placeholder: "Email Address", text: $viewModel.email)
            
            RocketGamesSecureField(placeholder: "Password", showPassword: $viewModel.showPassword, text: $viewModel.password)
            
            RocketGamesSecureField(placeholder: "Confirm Password", showPassword: $viewModel.showPasswordCheck, text: $viewModel.passwordCheck)
            
            Button {
                viewModel.registerWithEmail()
            } label: {
                Text("Register")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white)                    )
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppColor"))
    }
}

#Preview {
    RegistrationView()
}
