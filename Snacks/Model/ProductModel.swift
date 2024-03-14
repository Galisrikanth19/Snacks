//
//  ProductModel.swift
//  Created by Srikanth on 12/03/24.

import Foundation
import SwiftUI

struct ProductModel: Identifiable {
    let id: UUID = .init()
    let name: String
    let categeory: String
    let image: String
    let price: String
    let color: Color
}

var productList: [ProductModel] = [
    ProductModel(name: "Good Source", categeory: "Choco", image: "image1", price: "$8", color: Color.red),
    ProductModel(name: "Unreal Muffins", categeory: "Choco", image: "image2", price: "$67", color: Color.yellow),
    ProductModel(name: "Twister Chips", categeory: "Chips", image: "image3", price: "$78", color: Color.green),
    ProductModel(name: "Groops", categeory: "Chips", image: "image4", price: "$478", color: Color.purple),
    ProductModel(name: "Regular Nature", categeory: "Chips", image: "image5", price: "$48", color: Color.red),
    ProductModel(name: "Dark Russet", categeory: "Chips", image: "image6", price: "$200", color: Color.yellow),
    ProductModel(name: "Smiths Chips", categeory: "Chips", image: "image7", price: "$85", color: Color.green),
    ProductModel(name: "Deep River", categeory: "Chips", image: "image8", price: "$100", color: Color.purple)
]
