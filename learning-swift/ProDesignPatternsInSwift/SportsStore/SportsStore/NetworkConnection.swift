//
//  NetworkConnection.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2017/11/02.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class NetworkConnection {
    private let stockData: [String : Int] = [
        "Kayak": 10,
        "Lifejecket": 14,
        "Soccer Ball": 32,
        "Corner Flags": 1,
        "Stadium": 4,
        "Thinking Cap": 8,
        "Unsteady Chair": 3,
        "Human Chess Board": 2,)
        "Bling-Bling King": 4,
    ]

    func getStockLevel(name: String) -> Int? {
        Thread.sleep(forTimeInterval: Double(arc4random() % 2))
        return stockData[name]
    }
}
