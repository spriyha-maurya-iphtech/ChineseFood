//
//  GlassBackground.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//

import SwiftUI

struct GlassBackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white.opacity(0.2))
            .background(BlurView(style: .systemMaterial))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
    }
}

// UIVisualEffectView wrapper for Blur effect
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
