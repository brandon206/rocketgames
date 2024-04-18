//
//  CustomNavigationButton.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

enum CustomButtonType: String {
    case next = "Next"
    case previous = "Previous"
}

struct CustomNavigationButton: View {
    var type: CustomButtonType
    var action: () -> Void
    var body: some View {
        Button(action: { action() }) {
            ZStack {
                Text(type.rawValue)
            }
            .font(.subheadline)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .foregroundStyle( type == .previous ? Color.orange : .white)
            .background( type == .previous ? Color.white : Color.orange )
        }
        .buttonStyle(.plain)
        .cornerRadius(11)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.orange, lineWidth: 1)
                .opacity(type == .previous ? 1 : 0)
        )
    }
}

#Preview {
    HStack {
        CustomNavigationButton(type: .previous, action: {})
        CustomNavigationButton(type: .next, action: {})
    }
}
