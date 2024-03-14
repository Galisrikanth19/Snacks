//
//  ContentView.swift
//  Created by Srikanth on 12/03/24.

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                HomeView()
                    .environmentObject(cartManager)
                
                if cartManager.products.count > 0 {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        HStack(spacing: 30) {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading) {
                                Text("Cart")
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("\(cartManager.products.count) Item")
                                    .font(.system(size: 18))
                            }
                            
                            Spacer()
                            
                            ForEach(cartManager.products, id: \.name) { product in
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                            }
                        }
                        .padding(30)
                        .frame(height: 120)
                        .background(.black)
                        .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
                        .foregroundColor(.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
