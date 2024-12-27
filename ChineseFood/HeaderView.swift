//
//  HeaderView.swift
//  ChineseFood
//
//  Created by iPHTech34 on 06/12/24.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Hi Spriyha")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.5))
                Text("What do you want for dinner? 🍽")
                    .foregroundColor(.black.opacity(0.6))
            }
            Spacer()
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.black.opacity(0.5))
        }
        .padding(.horizontal)
    }
}
