//
//  CartView.swift
//  Snacks
//
//  Created by Srikanth on 13/03/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Cart")
                        .font(.system(size: 30))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("\(cartManager.products.count)")
                            .padding()
                            .frame(width: 70, height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                    }
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                            .foregroundColor(.black)
                    }
                }
                .foregroundColor(.black)
                .padding(30)
                
                
                ForEach(cartManager.products) { item in
                    CartProductCard(product: item)
                        .environmentObject(cartManager)
                }
                .padding(.horizontal)

                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Delivery Amount")
                        Spacer()
                        Text("Free")
                            .font(.system(size: 24, weight: .semibold))
                    }
                    
                    Divider()
                    
                    Text("Total Amount")
                        .font(.system(size: 24))
                    
                    Text("USD 38.00")
                        .font(.system(size: 36, weight: .semibold))
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .background(.yellow.opacity(0.5))
                .clipShape(.rect(cornerRadius: 30))
                .padding()
                
                
                Button {
                    
                } label: {
                    Text("Make Payment")
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.yellow.opacity(0.5))
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
}

struct CartProductCard: View {
    var product: ProductModel
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                
                Text(product.categeory)
                    .font(.callout)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text(product.price)
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
            
            Button {
                cartManager.removeFromCart(product: product)
            } label: {
                 Image(systemName: "trash.fill")
                    .imageScale(.large)
                    .foregroundColor(.red)
            }
        }
    }
}
