//
//  RocketGamesSecureField.swift
//  rocketgames
//
//  Created by Brandon Park on 3/19/24.
//

import SwiftUI

struct RocketGamesSecureField: View {
    var placeholder: String
    @Binding var showPassword: Bool
    @Binding var text: String
    
    var body: some View {
        if (showPassword) {
            RocketGamesTextField(placeholder: "Password", text: $text)
                .overlay(alignment: .trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassword = false
                        }
                    } label: {
                        Image(systemName: "eye")
                            .padding()
                            .contentTransition(.symbolEffect)
                            .foregroundColor(Color("AppColor"))
                    }
                }
        } else {
            SecureField(placeholder, text:$text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(.primary)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1)))
                .overlay(alignment: .trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassword = true
                        }
                    } label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .contentTransition(.symbolEffect)
                            .foregroundStyle(Color("AppColor"))
                    }
                }
        }
    }
}

#Preview {
    RocketGamesSecureField(placeholder: "Password", showPassword: .constant(true), text: .constant(""))
}
