//
//  RocketGamesSecureField.swift
//  rocketgames
//
//  Created by Brandon Park on 3/19/24.
//

import SwiftUI

struct RocketGamesSecureField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        SecureField("Password", text:$text)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.primary)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.ultraThinMaterial)
                .stroke(.primary, style: StrokeStyle(lineWidth: 1)))
    }
}

#Preview {
    RocketGamesSecureField(placeholder: "Password", text: .constant(""))
}
