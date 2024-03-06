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
    @Query private var items: [Item]

    var body: some View {
        TabView {
            MainView()
                .badge(2)
                .tabItem {
                    Label("Life Counter", systemImage: "tray.and.arrow.down.fill")
                }
            DeckView()
                .tabItem {
                    Label("Decks", systemImage: "tray.and.arrow.up.fill")
                }
            ProfileView()
                .badge("!")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
    

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
