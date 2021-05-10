//
//  ProductDataStore.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2017/11/03.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

final class ProductDataStore {
    var callback:((Product) -> Void)?
    private var networkQ: DispatchQueue
    private var uiQ: DispatchQueue
    lazy var products: [Product] = self.loadData()

    init() {
        networkQ = DispatchQueue.global(qos: .background)
        uiQ = DispatchQueue.main
    }

    private func loadData() -> [Product] {
        for p in productData {
            networkQ.async {
                let stockConn = NetworkPool.getConnection()
                let level = stockConn.getStockLevel(name: p.name)
                if (level != nil) {
                    p.stockLevel = level!
                    uiQ.async {
                        if (self.callback != nil) {
                            callback!(p)
                        }
                    }
                }
                NetworkPool.returnConnection(conn: conn)
            }
        }
        return productData
    }

    private var productData: [Product] = [
        Product(name: "kayak", description: "A boat for one person", category: "Watersports", price: 270.0, stockLevel: 10),

        Product(name: "Lifejacket", description: "Protective and fashionable", category: "Watersports", price: 48.95, stockLevel: 14),

        Product(name: "Soccer Ball", description: "FIFA-approved size and weight", category: "Soccer", price: 19.5, stockLevel: 32),

        Product(name: "Corner Flags", description: "Give your playing feild a professional touch", category: "Soccer", price: 7900.0, stockLevel: 4),

        Product(name: "Thinking Cap", description: "Improve your brain efficiency by 75%", category: "Chess", price: 16.0, stockLevel: 8),

        Product(name: "Unsteady Chair", description: "Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel: 3),

        Product(name: "Human Chess Board", description: "A fun game for the family", category: "Watersports", price: 270.0, stockLevel: 10),

        Product(name: "Bling-Bling King", description: "Gold-plated, diamond-studded King", category: "Chess", price: 1200.0, stockLevel: 4)
    ]

}
