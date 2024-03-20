//
//  ContentView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var person: [Person]
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                
                RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)
                
                VStack(spacing: 20) {
                    Text("Welcome").foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -100, y: -100)
                    
                    TextField("Email", text: $email).foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            
                        }
                }
                .frame(width: 350)
            }
            .ignoresSafeArea()
            
            //            TabView {
            //                HomeView()
            //                    .badge(2)
            //                    .tabItem {
            //                        Label("Life Counter", systemImage: "tray.and.arrow.down.fill")
            //                    }
            //                DeckView()
            //                    .tabItem {
            //                        Label("Decks", systemImage: "tray.and.arrow.up.fill")
            //                    }
            //                ProfileView()
            //                    .badge("!")
            //                    .tabItem {
            //                        Label("Profile", systemImage: "person.crop.circle.fill")
            //                    }
            //            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
