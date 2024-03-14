//
//  HomeView.swift
//  Created by Srikanth on 12/03/24.

import SwiftUI

struct HomeView: View {
    @State var selectedCategeory = "All"
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    //Header
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                    }
                    .foregroundColor(.black)
                    .padding(30)
                    
                    //CategeoryList
                    categeoryListView
                    
                    //List
                    HStack {
                        Text("Choco **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    
                    //CollectionViews
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    var categeoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categeoryList, id: \.id) { item in
                        Button {
                            selectedCategeory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(selectedCategeory == item.title ? "\(item.icon)Sel" : (item.icon))
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                
                                Text(item.title)
                                    .foregroundColor(selectedCategeory == item.title ? .white : .black)
                            }
                            .frame(height: 20)
                            .padding()
                            .background(selectedCategeory == item.title ? .black : .gray.opacity(0.1))
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(CartManager())
}

struct ProductCard: View {
    var product: ProductModel
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 270, height: 380)
                .opacity(0.2)
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 140)
                
                Text(product.categeory)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Text(product.price + ".0")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 90, height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .tint(.white)
                    }
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.5))
                .clipShape(Capsule())
            }
            .padding(30)
            .frame(width: 336, height: 442)
        }
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}
