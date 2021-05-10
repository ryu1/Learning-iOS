//
//  CounterTest.swift
//  Hello_World
//
//  Created by 石塚隆一 on 2014/08/03.
//  Copyright (c) 2014年 石塚隆一. All rights reserved.
//

import XCTest

class CounterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test2回increamentを実行する() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        
        let counter: Counter = Counter()
        XCTAssertEqual(counter.currentCount, 0, "0でなければいけない。")
        XCTAssertEqual(counter.increment().currentCount, 1, "1でなければいけない。")
        XCTAssertEqual(counter.increment().currentCount, 2, "2でなければいけない。")
        
    }
    func test2回increamentbyを実行する() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        
        let counter: Counter = Counter(count: 10)
        XCTAssertEqual(counter.currentCount, 10, "10でなければいけない。")
        XCTAssertEqual(counter.incrementBy(1, 2).currentCount, 12, "12でなければいけない。")
        XCTAssertEqual(counter.incrementBy(2, 4).currentCount, 20, "20でなければいけない。")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
