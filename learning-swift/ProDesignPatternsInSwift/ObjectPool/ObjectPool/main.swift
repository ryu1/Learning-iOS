//
//  main.swift
//  ObjectPool
//
//  Created by 石塚隆一 on 2017/10/16.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

var queue = DispatchQueue(label: "workQ", attributes: .concurrent)

var group = DispatchGroup()

print("Starting...")

for i in 1 ... 35 {
    queue.async(group: group) {
        let book = Library.checkout(reader: "reader#\(i)")
        //print("Book#\(String(describing: book?.stockNumber))")
        if (book != nil) {
            Thread.sleep(forTimeInterval: Double(arc4random() % 2))
            Library.returnBook(book: book!)
        } else {
            // printはスレッドセーフではないので、`queue.async(flags: .barrier) { print("All blocks complete")..`と入り混じらないようにするため
            queue.async(flags: .barrier, execute: {
                print("Request \(i) failed")
            })
        }
    }
}

_ = group.wait(timeout: .distantFuture)

queue.async(flags: .barrier) {
    print("All blocks complete")
    Library.printReport()
}



