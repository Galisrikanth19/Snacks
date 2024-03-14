//
//  CartManager.swift
//  Created by Srikanth on 14/03/24.

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products:[ProductModel] = []
    @Published private var total: CGFloat = 0
    
    func addToCart(product: ProductModel) {
        products.append(product)
        total = total + 10
    }
    
    func removeFromCart(product: ProductModel) {
        products = products.filter {
            $0.id != product.id
        }
        
        if total >= 10 {
            total = total - 10
        }
    }
}
