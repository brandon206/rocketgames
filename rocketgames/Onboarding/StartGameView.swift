//
//  StartGameView.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

struct StartGameView: View {
    var body: some View {
        Spacer()
        
        Text("Set Starting Life")
        
//        TODO: add logic for starting life total buttons
        
        Spacer()
        
        HStack {
            CustomNavigationButton(type: .previous, action: {})
            Spacer()
            CustomNavigationButton(type: .next, action: {})
        }
            .padding(.leading, 50)
            .padding(.trailing, 50)
    }
}

#Preview {
    StartGameView()
}
