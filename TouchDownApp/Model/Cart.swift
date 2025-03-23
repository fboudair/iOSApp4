//
//  Cart.swift
//  TouchDownApp
//
//  Created by Fatima Bdair on 2025-03-10.
//

import SwiftUI
class CartItem: Identifiable, ObservableObject {
    var product: Product
    @Published var quantity: Int
    
    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
}

class Cart: ObservableObject {
    @Published var items: [CartItem] = []
    
    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product))
        }
    }
    
    func removeCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items.remove(at: index) 
        }
    }
    
    func itemNum() -> Int {
        return items.count
    }
}
