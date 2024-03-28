//
//  RocketGamesTextField.swift
//  rocketgames
//
//  Created by Brandon Park on 3/19/24.
//

import SwiftUI

struct RocketGamesTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text:$text)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.primary)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1)))
    }
}

#Preview {
    RocketGamesTextField(placeholder: "Email", text: .constant(""))
}
