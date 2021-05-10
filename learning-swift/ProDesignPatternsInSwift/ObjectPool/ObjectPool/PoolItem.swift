//
//  PoolItem.swift
//  ObjectPool
//
//  Created by 石塚隆一 on 2017/11/19.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

protocol PoolItem {
    var canReuse: Bool { get }
}
