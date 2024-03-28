//
//  RegistrationView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/28/24.
//

import SwiftUI
import Observation

@Observable
class RegistrationViewModel {
    var email = ""
    var password = ""
    var showPassword = false
    var passwordCheck = ""
    var showPasswordCheck = false
}

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = RegistrationViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Register Now")
                    .font(.largeTitle)
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
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}
