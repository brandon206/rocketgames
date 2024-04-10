//
//  rocketgamesApp.swift
//  rocketgames
//
//  Created by Brandon Park on 3/3/24.
//

import SwiftUI
import Firebase

@main
struct rocketgamesApp: App {
    // register app delegate for Firebase setup
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
