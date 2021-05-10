//
//  Section3Tests.swift
//  ProgrammingLanguageSwiftDefinitiveGuide
//
//  Created by 石塚隆一 on 2016/05/05.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import XCTest
@testable import ProgrammingLanguageSwiftDefinitiveGuide

class Section3Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPrintDate() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        printDate()
    }

    func testPrintTime() {
        printTime()
    }

    func testPrintDateWithTime() {
        printDateWithTime()
    }

    func testPrintPointOfTime() {
        printPointOfTime()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testPrintClock() {
        printClock()
    }

    func testDate1IsLeap() {
        XCTAssertTrue(Date1.isLeap(2000))
        XCTAssertEqual(Date1.daysOfMonth(2, year: 2000), 29)
    }

    func testPrintDateWithString() {
        printDateWithString()
    }

    func testPrintLCD() {
        printLCD()
    }

    func testPrintOunce() {
        printOunce()
    }

    func testValueWithCounter() {
        var w = ValueWithCounter(0.125)
        for _  in 0 ..< 5 {
            print(w.value)
        }
        print(w.count)

    }

    func testValueInLine() {
        let z = ValueInLine(109.7)
        print(z.value)
        z.value = 0.0
        print(z.value)

    }

    func testLandscape() {
        XCTAssertTrue(landscape)
    }

    func testStock() {
        var stock = Stock(price: 400)
        stock.price = 410
        stock.price = 480
        stock.price = 430
        print("\(stock.count), \(stock.high)")
    }

    func testFoodMenu() {
        var menu = FoodMenu()

        for var i = 0; i < menu.count; i += 1 {
            print(menu[i], terminator: " ")
        }

        print("")

        menu[0] = "もり"
        menu[5] = "くるみ"
    }

    func testTime4() {
        let tm = Time4(hour: 19, min: 40)
        print(tm)
        let t2 = tm.add(20)
        print("時刻は\(t2)です。")
    }

}
