//
//  Untitled.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//

import SwiftUI
struct BottomNavBar: View {
    var body: some View {
        ZStack {
            // Background of the Tab Bar
            HStack {
                Spacer()
                Image(systemName: "house")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.5))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.5))
                Spacer()
                Spacer() // Leave space for the center button
                Spacer()
                Image(systemName: "heart")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.5))
                Spacer()
                Image(systemName: "bell")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.5))
                Spacer()
            }
            .padding()
            .background(
                GlassBackgroundView()
                    .clipShape(Capsule())
            )
            //.padding(.horizontal)
            .frame(maxWidth: .infinity)
            // Center Button
            VStack {
                
                NavigationLink(destination: CartView())  {
                    Image(systemName: "bag")
                        .font(.system(size: 24))
                        .foregroundColor(.black.opacity(0.5))
                        .frame(width: 60, height: 60)
                        .background(
                            Circle()
                                .fill(Color.orange.opacity(0.7))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                        )
                }
                .offset(y: -30) // Adjust this to lift the button out of the bar
            }
        }
    }
}
