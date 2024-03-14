//
//  CategeoryModel.swift
//  Created by Srikanth on 12/03/24.

import Foundation

struct CategeoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categeoryList: [CategeoryModel] = [
    CategeoryModel(icon: "", title: "All"),
    CategeoryModel(icon: "choco", title: "Choco"),
    CategeoryModel(icon: "waffles", title: "Waffles"),
    CategeoryModel(icon: "toffee", title: "Toffee")
]
