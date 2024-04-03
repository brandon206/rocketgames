//
//  ForgotPasswordView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/28/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Bindable var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            Text("Reset Password")
                .font(.title)
                .bold()
            
            RocketGamesTextField(placeholder: "Please enter your email", text: $viewModel.resetPasswordEmail)
            
            Button {
                viewModel.resetPassword()
            } label: {
                Text("Reset Password")
                    .bold()
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
    }
}

#Preview {
    ForgotPasswordView(viewModel: SignInViewModel())
}
