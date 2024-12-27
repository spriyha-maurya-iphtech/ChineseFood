//
//  DishImageView.swift
//  ChineseFood
//
//  Created by iPHTech34 on 17/12/24.
//
import SwiftUI

struct DishImageView: View {
    var body: some View {
        Image("Oxtail") // Replace with your image name
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
            .frame(width: 250, height: 250)
            .padding()
    }
}

