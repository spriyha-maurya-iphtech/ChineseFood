//
//  DetailsView.swift
//  ChineseFood
//
//  Created by iPHTech34 on 17/12/24.
//
import SwiftUI
struct DetailsView: View {
    @State private var quantity = 1
    
    var body: some View {
        ScrollView { // Allows scrolling for overflow content
            VStack(alignment: .leading, spacing: 5) {
                // Title and Price
                HStack {
                    VStack(alignment: .leading) {
                        Text("Korean Bibimbap")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        HStack(spacing: 5) {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                            }
                            Text("5.0")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    Text("$24")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                // Delivery Hours and Add-to-Cart in HStack
                HStack(spacing: 15) {
                    HStack(spacing: 5) {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.orange.opacity(0.7))
                        Text("20-25 min")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "bag.fill")
                            .foregroundColor(.orange.opacity(0.7))
                        Text("Add to Cart")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 5) {
                        Button(action: { if quantity > 1 { quantity -= 1 } }) {
                            Image(systemName: "minus")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                        Text("\(quantity)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(minWidth: 30, alignment: .center)
                        Button(action: { quantity += 1 }) {
                            Image(systemName: "plus")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.orange.opacity(0.7))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4))
                }
                .padding(.top, 10)
                Spacer()
                // Description
                Text("Details")
                    .font(.headline)
                Text("Delicious and well-prepared Korean Bibimbap with different varieties of vegetables, rice, egg, and spicy Gochujang sauce. A nutritious and flavorful meal.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                // Ingredients
                Text("Ingredients")
                .font(.headline)
                
                HStack(spacing: 15) {
                    ForEach(["🍔", "🌮"], id: \.self) { icon in
                        Text(icon)
                            .font(.title)
                            .padding()
                            //.background(Circle().fill(Color.yellow.opacity(0.3)))
                    }
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "bag")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 60, height: 60)
                    }
                    
                     //   .background(Circle().fill(Color.yellow.opacity(0.3)))
                        .background(
                            Circle()
                                .fill(Color.orange.opacity(0.7))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                        )
                    
                    ForEach(["🍜", "🍕"], id: \.self) { icon in
                        Text(icon)
                            .font(.title)
                            .padding()
                            //.background(Circle().fill(Color.yellow.opacity(0.3)))
                    }
                }
                .frame(maxWidth: .infinity) // Centers horizontally
                
               // Spacer() // Adds spacing at the bottom
            }
            .padding()
            .background(Color.white.opacity(0.7))
            .cornerRadius(20)
        }
    }
}

