//
//  SignInView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/19/24.
//

import SwiftUI
import Observation

@Observable
class SignInViewModel {
    var email = ""
    var password = ""
}

struct SignInView: View {
    @State var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            RocketGamesTextField(placeholder: "Email", text: $viewModel.email)
            RocketGamesSecureField(placeholder: "Password", text: $viewModel.password)
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
