//
//  NetworkPool.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2017/11/03.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

final class NetworkPool {
    private let connectionCount = 3
    private let connections = [NetworkConnection]()
    private let semaphore: DispatchSemaphore
    private let queue: DispatchQueue
    private var itemsCreated = 0

    private init() {
//        for _ in 0 ..< connectionCount {
//            connections.append(NetworkConnection()
//        }
        semaphore = DispatchSemaphore(value: connectionCount)
        queue = DispatchQueue(label: "networkpoolQ")
    }

    private func doGetConnection() -> NetworkConnection {
        semaphore.wait(timeout: DispatchTime.distantFuture)

        var result: NetworkConnection? = nil
        queue.sync {
            if (connections.count > 0) {
                result = connections.remove(at: 0)
            } else if (self.itemsCreated < self.connectionCount) {
                result = NetworkConnection()
                self.itemsCreated += 1
            }
        }
        return result
    }

    private func doReturnConnection(conn: NetworkConnection) {
        queue.async {
            self.connections.append(conn)
            self.semaphore.signal()
        }
    }

    class func getConnection() -> NetworkConnection {
        return sharedInstance.doGetConnection
    }

    class func returnConnection(conn: NetworkConnection) {
        sharedInstance.doReturnConnection(conn: conn)
    }

    private class var sharedInstance: NetworkPool {
        get {
            struct SingletonWrapper {
                static let singleton = NetworkPool()
            }
            return SingletonWrapper.singleton
        }
    }

}
