//
//  CartView.swift
//  ChineseFood
//
//  Created by iPHTech34 on 24/12/24.
//

import SwiftUI

// MARK: - CartItem Model
struct CartItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    var quantity: Int
    let price: Int
}

// MARK: - CartView
struct CartView: View {
    @State private var cartItems: [CartItem] = [
        CartItem(imageName: "Pizza", title: "Italian Pizza", subtitle: "Spicy Chicken Pizza", quantity: 1, price: 14),
        CartItem(imageName: "Kimchi", title: "Korean Bibimbap", subtitle: "Korean mixed rice", quantity: 1, price: 48),
        CartItem(imageName: "Oxtail", title: "Braised Oxtails", subtitle: "Chinese Spicy Food", quantity: 1, price: 21)
    ]
    private let deliveryCharge: Int = 25
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            // Background
            TranslucentBackgroundView()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Navigate back
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Circle().fill(Color.white.opacity(0.8)))
                    }
                    Spacer()
                    Text("Cart")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()

                // Cart Items List
                ScrollView {
                    ForEach(cartItems) { item in
                        SwipeableCartItemView(
                            item: item,
                            onDelete: { deletedItem in
                                withAnimation {
                                    cartItems.removeAll { $0.id == deletedItem.id }
                                }
                            },
                            onQuantityChange: { updatedItem in
                                if let index = cartItems.firstIndex(where: { $0.id == updatedItem.id }) {
                                    cartItems[index] = updatedItem
                                }
                            }
                        )
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
                .padding(.bottom) // Prevent content from overlapping the checkout section

                // Summary Section
                VStack(spacing: 12) {
                    HStack {
                        Text("Subtotal")
                            .font(.body)
                        Spacer()
                        Text("$\(calculateSubtotal())")
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Delivery")
                            .font(.body)
                        Spacer()
                        Text("$\(deliveryCharge)") // Assuming free delivery
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    Divider()
                    HStack {
                        Text("Total")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text("$\(calculateTotal())")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    Button(action: {
                        // Checkout Action
                    }) {
                        Text("Check Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .shadow(radius: 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // Helper to Calculate Subtotal
    private func calculateSubtotal() -> Int {
        cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
    }
    // Helper to calculate total (subtotal + delivery charge)
        private func calculateTotal() -> Int {
            calculateSubtotal() + deliveryCharge
        }
}
struct SwipeableCartItemView: View {
    let item: CartItem
    let onDelete: (CartItem) -> Void
    let onQuantityChange: (CartItem) -> Void

    @State private var offset: CGFloat = 0
    private let maxSwipe: CGFloat = -100 // Maximum distance to swipe left

    var body: some View {
        ZStack {
            // Background for swipe (Delete action)
            HStack {
                Spacer()
                Button(action: {
                    onDelete(item)
                }) {
                    Image(systemName: "trash")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 80)
                        .background(Color.red)
                        .cornerRadius(15)
                }
            }
            .padding(.horizontal)

            // Foreground cart item view
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack {
                        // Quantity controls
                        HStack(spacing: 10) {
                            Button(action: {
                                var updatedItem = item
                                if updatedItem.quantity > 1 {
                                    updatedItem.quantity -= 1
                                    onQuantityChange(updatedItem)
                                }
                            }) {
                                Image(systemName: "minus")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }

                            Text("\(item.quantity)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(minWidth: 30, alignment: .center)

                            Button(action: {
                                var updatedItem = item
                                updatedItem.quantity += 1
                                onQuantityChange(updatedItem)
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(6)
                        .background(Capsule().fill(Color.orange.opacity(0.7))
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))

                        Spacer()

                        Text("$\(item.price * item.quantity)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // Only allow offset changes for left swipe
                        if gesture.translation.width < 0 {
                            offset = gesture.translation.width
                        }
                    }
                    .onEnded { _ in
                        if offset < maxSwipe {
                            // Trigger delete if swiped far enough
                            withAnimation {
                                onDelete(item)
                            }
                        } else {
                            // Reset offset if swipe isn't far enough
                            withAnimation {
                                offset = 0
                            }
                        }
                    }
            )
        }
    }
}



#Preview {
    CartView()
}
