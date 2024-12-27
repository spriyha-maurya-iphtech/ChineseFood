//
//  BackgroundColor.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//
import SwiftUI
struct TranslucentBackgroundView: View {
    var body: some View {
        ZStack {
            // Apply the system blur effect
            BlurView(style: .systemUltraThinMaterial)
                .ignoresSafeArea()  // Ensures the background covers the entire screen
            
            // Optional: Dark overlay for subtle tint
            Color.black.opacity(0.2)  // Adjust this opacity for desired tint
                .ignoresSafeArea()
        }
    }
}
#Preview {
    TranslucentBackgroundView()
}
