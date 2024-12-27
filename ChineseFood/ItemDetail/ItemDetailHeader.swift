//
//  ItemDetailHeader.swift
//  ChineseFood
//
//  Created by iPHTech34 on 17/12/24.
//
import SwiftUI

struct ItemDetailHeader: View {
    var presentationMode: Binding<PresentationMode> 
    var body: some View {
        HStack {
            Button(action: {
                // Back Button Action
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding()
                    .background(Circle().fill(Color.white.opacity(0.8)))
            }
            
            Spacer()
            
            Button(action: {
                // Favorite Button Action
            }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.black)
                    .padding()
                    .background(Circle().fill(Color.white.opacity(0.8)))
            }
        }
    }
}

