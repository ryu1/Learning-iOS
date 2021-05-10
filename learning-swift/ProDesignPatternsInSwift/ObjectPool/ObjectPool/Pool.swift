//
//  Pool.swift
//  ObjectPool
//
//  Created by 石塚隆一 on 2017/10/16.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class Pool<T: PoolItem> {

    private var data = [T]()

    private let arrayQ = DispatchQueue(label: "array!")

    private let semaphore: DispatchSemaphore

//    private var itemCount: Int = 0

    private let maxItemCount: Int

    private let itemFactory: () -> T
    
//    private var ejectedItems = 0
//
//    private var poolExhausted = false
    
//    private let peakFactory: () -> T
//    private let peakReaper: (T) -> Void

    private var createdCount: Int = 0
//    private var normalCount: Int;
//    private var peakCount: Int;
//    private var returnCount: Int;
//    private var waitTime: Int;

    private let itemAllocator: ([T]) -> Int

//    init(items: [T]) {
//        data.reserveCapacity(data.count)
//        for item in items {
//            data.append(item)
//        }
//        semaphore = DispatchSemaphore(value: items.count)
//    }

//    init(maxItemCount: Int, factory: @escaping () -> T) {
//        self.maxItemCount = maxItemCount
//        self.itemFactory = factory
//        semaphore = DispatchSemaphore(value: maxItemCount)
//    }
    
//    init(itemCount: Int, peakCount: Int, returnCount: Int, waitTime: Int = 2, itemFactory: @escaping () -> T, peakFactory: @escaping () -> T, reaper: @escaping (T) -> Void) {
//
//        self.normalCount = itemCount
//        self.peakCount = peakCount
//        self.returnCount = returnCount
//        self.waitTime = waitTime
//        self.itemFactory = itemFactory
//        self.peakFactory = peakFactory
//        self.peakReaper = reaper
//        semaphore = DispatchSemaphore(value: itemCount)
//
//    }

    init(itemCount: Int, itemFactory: @escaping () -> T, itemAllocator: @escaping ([T]) -> Int) {
        self.maxItemCount = itemCount
        self.itemFactory = itemFactory
        self.itemAllocator = itemAllocator
        semaphore = DispatchSemaphore(value: itemCount)
    }

//    func getFromPool(maxWaitSeconds: Int = -1) -> T? {
//        var result: T?
////        if (data.count > 0) {
//        // セマフォのカウンタがデクリメントする.
//        // やがて、0になるブロックされる
//        let waitTime = maxWaitSeconds < 0 ? DispatchTime.distantFuture :  DispatchTime.now() + Double(maxWaitSeconds)
//
//        if (!poolExhausted) {
//            if (semaphore.wait(timeout: waitTime) == .success) {
//                if (!poolExhausted) {
//                    arrayQ.sync {
//                        //                result = self.data.remove(at: 0)
//                        if (self.data.count == 0 && self.itemCount < self.maxItemCount) {
//                            result = self.itemFactory()
//                            self.itemCount += 1
//                        } else {
//                            result = self.data.remove(at: 0)
//                        }
//                    }
//                }
//            }
//        }
//
//        return result
//    }
    
//    func getFromPool() -> T? {
//        var result: T?
//        let expiryTime = DispatchTime.now() + Double(self.waitTime)
//
//        if (self.semaphore.wait(timeout: expiryTime) == .success) {
//            arrayQ.sync {
//                if (self.data.count == 0) {
//                    result = self.itemFactory()
//                    self.createdCount += 1
//                } else {
//                    result = self.data.remove(at: 0)
//                }
//            }
//        } else {
//            arrayQ.sync {
//                result = self.peakFactory()
//                self.createdCount += 1
//            }
//        }
//
//        return result
//    }

    func getFromPool() -> T? {
        var result: T?
        
        if (self.semaphore.wait(timeout: .distantFuture) == .success) {
            arrayQ.sync {
                if (self.data.count == 0) {
                    result = self.itemFactory()
                    self.createdCount += 1
                } else {
                    result = self.data.remove(at: self.itemAllocator(self.data))
                }
            }
        }
        return result
    }

//    func returnToPool(_ item: T) {
//        arrayQ.async {
//            if (item.canReuse) {
//                self.data.append(item)
//                // セマフォのカウンタでインクリメントする.
//                self.semaphore.signal()
//            } else {
//                self.ejectedItems += 1
//                if self.ejectedItems == self.maxItemCount {
//                    self.poolExhausted = true
//                    self.flushQueue()
//                }
//            }
//        }
//    }
    
//    func returnToPool(_ item: T) {
//
//        arrayQ.async {
//            if (self.data.count > self.returnCount &&
//                self.createdCount > self.normalCount) {
//
//                self.peakReaper(item)
//                self.createdCount -= 1
//
//            } else {
//                self.data.append(item)
//                self.semaphore.signal()
//            }
//        }
//    }

    func returnToPool(_ item: T) {
        arrayQ.async {
            self.data.append(item)
            self.semaphore.signal()
        }
    }

//    private func flushQueue() {
//        // semaphoreのwaitをとくために、とけるまでsignalを送り続けている
//        let dQueue = DispatchQueue(label: "drainer", attributes: .concurrent)
//        var backlogCleared = false
//
//        dQueue.async {
//            _ = self.semaphore.wait(timeout: .distantFuture)
//            backlogCleared = true
//        }
//
//        dQueue.async {
//            while !backlogCleared {
//                self.semaphore.signal()
//            }
//        }
//    }

    func processPoolItems(callback: @escaping ([T]) -> Void) {
        arrayQ.sync(flags: .barrier) {
            callback(self.data)
        }
    }

}
