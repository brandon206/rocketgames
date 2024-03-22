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
                    }
                }
        } else {
            SecureField(placeholder, text:$text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(.primary)
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.ultraThinMaterial)
                    .stroke(.primary, style: StrokeStyle(lineWidth: 1)))
                .overlay(alignment: .trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassword = true
                        }
                    } label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .contentTransition(.symbolEffect)
                    }
                }
        }
    }
}

#Preview {
    RocketGamesSecureField(placeholder: "Password", showPassword: .constant(true), text: .constant(""))
}
