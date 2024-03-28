//
//  HomeView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/18/24.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = SignOutViewModel()

    var body: some View {
        VStack {
            Text("THIS IS Home VIEW")
            
            Button(role: .destructive) {
                viewModel.signOut()
            } label: {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    HomeView()
}
