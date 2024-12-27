//
//  Untitled.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//

import SwiftUI
struct RecommendedCardView: View {
    let item: RecommendedItem
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            ZStack(alignment: .top) {
                // Card content
                VStack(spacing: 20) { // Increased spacing for better layout
                    Spacer()
                    
                    // Title
                    Text(item.title)
                        .font(.headline) // Slightly larger font
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.top,25)
                    // Subtitle
                    Text(item.subtitle)
                        .font(.system(size: 14)) // Increased font size for readability
                        .foregroundColor(.gray.opacity(0.7))
                    
                    // Price and Favorite Icon
                    HStack {
                        Text("$\(item.price)")
                            .font(.title3) // Larger price font for emphasis
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "heart")
                            .font(.system(size: 18)) // Larger icon size
                            .foregroundColor(.black.opacity(0.8))
                    }
                }
                .padding(20) // Increased padding inside the card
                .background(
                    GlassBackgroundView()
                )
                .clipShape(RoundedRectangle(cornerRadius: 25)) // Slightly larger corner radius
                .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 6)
                .padding(.top, 50) // Increased space for overlapping image
                
                // Overlapping Image
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 130) // Increased image size
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
                    .offset(y: 0) // Slightly increased offset for better overlap
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 6)
            }
            .padding(.horizontal)
        }
    }
}
struct RecommendedItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let price: Int
}

let recommendedChineseDishes = [
    RecommendedItem(imageName: "Kimchi", title: "Kimchi", subtitle: "Steamed or Fried", price: 12),
    RecommendedItem(imageName: "Noodles", title: "Noodles", subtitle: "Classic Fried Rice", price: 10),
    RecommendedItem(imageName: "Oxtail", title: "Oxtail", subtitle: "Tangy Pineapple", price: 15),
    RecommendedItem(imageName: "Pizza", title: "Pizza", subtitle: "Spicy Style Tangy", price: 20)
]
