//
//  main.swift
//  FactoryMethod
//
//  Created by 石塚隆一 on 2017/11/04.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

let passengers = [1, 3, 5]

for p in passengers {
    print("\(p) passengers: \(CarSelector.selector(passengers: p)!)")
}
