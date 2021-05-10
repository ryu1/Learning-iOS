//
//  Logger.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2017/01/08.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

let productLogger = Logger<Product>(callback: { p in
    print("Change: \(p.name) \(p.stockLevel) items in stock", terminator: "\n")
})

class Logger<T> where T: NSObject, T: NSCopying {
    var dataItems: [T] = []
    var callback: (T) -> Void
    var arrayQ = DispatchQueue(label: "arrayQ", attributes: .concurrent)
    // There is not .serial attribute anymore, but dispatch queues are by default serial, unless you specify the .concurrent attribute:
    var callbackQ = DispatchQueue(label: "callbackQ")

    init(callback: @escaping (T) -> Void, protected: Bool = true) {
        self.callback = callback
        // callbackの並列実行によるデータ破壊を防ぐ
        if (protected) {
            self.callback = { (item: T) in
                self.callbackQ.sync {
                    callback(item);
                }
            }
        }
    }

    func logItem(item: T) {
        // キューの手前にあるブロックがすべて完了するまで、
        // このバリアブロックの実行は開始されず、
        // このバリアブロックが完了するまで
        // キューの後続のブロックは処理されない
        arrayQ.async(flags: .barrier) {
            self.dataItems.append(item)
            self.callback(item)
        }
    }

    func processItems(callback: (T) -> Void) {
        // dispatch_sync関数を呼び出して配列を列挙するブロックを追加し
        // このブロックの実行が完了するまでメソッドから制御が戻らないようにしている。
        arrayQ.sync { 
            for item in dataItems {
                callback(item)
            }
        }
    }

}
