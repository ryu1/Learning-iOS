//
//  Counter.swift
//  Hello_World
//
//  Created by 石塚隆一 on 2014/08/03.
//  Copyright (c) 2014年 石塚隆一. All rights reserved.
//

import Foundation

class Counter {
    
    private var count: Int
    
    internal var currentCount: Int {
        get {
            return count;
        }
    }
    
    init(count: Int) {
        self.count = count
    }
    
    convenience init() {
        self.init(count: 0);
    }

    func increment() -> Counter {
        count++;
        return self;
    }
    
    func incrementBy(amount: Int, _ numberOfTimes: Int) -> Counter {
        count += amount * numberOfTimes
        return self;
    }
}

