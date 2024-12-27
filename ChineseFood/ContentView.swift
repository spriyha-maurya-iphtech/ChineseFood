//
//  ContentView.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Translucent background
                TranslucentBackgroundView()
                
                VStack {
                    // Header Section with padding
                    HeaderView()
                        .padding(.top, 60) // Adjust this value as needed
                    
                    // Category Toggle Buttons
                    CategoryToggleView()
                        .padding(.vertical)
                    
                    // Recommended Section
                    VStack(alignment: .leading) {
                        Text("Recommended Dishes")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black.opacity(0.5))
                            .padding(.horizontal)
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                ForEach(recommendedChineseDishes) { item in
                                    RecommendedCardView(item: item)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    
                    // Bottom Navigation Bar
                    BottomNavBar()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
#Preview {
    ContentView()
}
