//
//  ItemDetail.swift
//  ChineseFood
//
//  Created by iPHTech34 on 17/12/24.
//
import SwiftUI

struct ItemDetail: View {
    let item: RecommendedItem
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            // Translucent background with blur
            Color.clear
                .background(
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                )
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                // Top Header
                ItemDetailHeader(presentationMode: presentationMode)
                    .padding(.top, 5)
                
                // Dish Image
                DishImageView()
                
                // Details
                DetailsView()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

