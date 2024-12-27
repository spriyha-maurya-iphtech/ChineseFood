//

//  Untitled.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//

import SwiftUI
struct CategoryToggleView: View {
    @State private var selectedCategory = 0
    let categories = ["🍔", "🌮", "🍜", "🍕"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories.indices, id: \.self) { index in
                    Button(action: {
                        selectedCategory = index
                    }) {
                        Text(categories[index])
                            .font(.headline)
                            .padding(.horizontal, 30) // Increased width
                            .padding(.vertical, 6)   // Decreased height
                            .background(
                                Capsule()
                                    .fill(selectedCategory == index ? Color.orange.opacity(0.8) : Color.white.opacity(0.3))
                            )
                            .foregroundColor(selectedCategory == index ? Color.black : Color.white)
                            .overlay(
                                Capsule()
                                    .strokeBorder(Color.white.opacity(0.6), lineWidth: selectedCategory == index ? 0 : 1)
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

