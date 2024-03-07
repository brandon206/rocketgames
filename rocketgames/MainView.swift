//
//  MainView.swift
//  rocketgames
//
//  Created by Brandon Park on 3/3/24.
//

import SwiftUI

struct MainView: View {
    let buttonsData: [(String, String, Color, Color)] = [("Roll a dice", "dice", .black, .white), ("Flip a coin", "circle.fill", .black, .yellow), ("Restart Game", "arrow.circlepath", .green, .white), ("End Game", "xmark", .red, .white)]
    
    
    var body: some View {
        VStack {
            
            ZStack {
                Text("Game Options").font(.title).foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                HStack {
                    Spacer()
                    
                    Button(action: {
                        // Handle close button click action
                        print("Close button clicked!")
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    // Handle button click action
                    print("Button \("players") clicked!")
                }) {
                    Image(systemName: "person")
                        .font(.system(size: 30))
                        .padding()
                        .background(Circle().foregroundColor(.blue))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Text("Players")
                    .foregroundColor(.white)
                    .padding(.top, 8)
            }
            .padding()
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(buttonsData, id: \.0) { buttonText, iconName, color, color2 in
                    VStack {
                        Button(action: {
                            // Handle button click action
                            print("Button \(buttonText) clicked!")
                        }) {
                            Image(systemName: iconName)
                                .font(.system(size: 30))
                                .padding()
                                .background(Circle().foregroundColor(color))
                                .foregroundColor(color2)
                                .clipShape(Circle())
                        }
                        
                        Text(buttonText)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }
                }
            }
            .padding(16)
            Spacer()
        }
        .background(Image("island") // Replace "yourImageName" with the actual name of your image asset
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    MainView()
}

