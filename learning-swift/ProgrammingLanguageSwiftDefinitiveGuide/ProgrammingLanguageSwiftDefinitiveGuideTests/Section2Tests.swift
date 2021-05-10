//
//  Section2Tests.swift
//  Section2
//
//  Created by 石塚隆一 on 2016/03/19.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import XCTest
@testable import ProgrammingLanguageSwiftDefinitiveGuide

class Section2: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testIsTriangle() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertFalse(Sample().isTriangle(1, b: 2, c: 3))
        XCTAssertTrue(Sample().isTriangle(12.0, b: 20.0, c: 8.5))
    }

    func testMySwap() {
        var x = 100
        var y = 0
        mySwap(&x, &y)
        XCTAssertEqual(x, 0)
        XCTAssertEqual(y, 100)
    }

    func testArea1() {
        let a = area1(1, w: 2)
        XCTAssertEqual(a, 2)

    }

    func testArea2() {
        let a = area2(height: 1, width: 2)
        XCTAssertEqual(a, 2)
    }

    func testArea4() {
        let a = area4(1, 2)
        XCTAssertEqual(a, 2)
    }

    func testCharge() {
        XCTAssertEqual(charge(250), 3700)
        XCTAssertEqual(charge(90, logo: 1), 3000)
        XCTAssertEqual(charge(120, ruby: 2), 3300)
        XCTAssertEqual(charge(500, ruby: 1, logo: 2), 6000)
    }

    func testDayOfWeek1() {
        let month = 3
        let day = 21

        let dayOfWeek = dayOfWeek1(month, d: day, year: 2016)

        XCTAssertEqual(dayOfWeek, 1)
    }

    func testDayOfWeek2() {
        let month = 1
        let day = 24

        let dayOfWeek = dayOfWeek2(month, d: day, year: 2016)
        XCTAssertEqual(dayOfWeek, 0)
        XCTAssertEqual(month, 1)
        XCTAssertEqual(day, 24)
    }

    func testMySwap1() {
        var x = 1, y = 2, z = 3
        mySwap(&x, &y, &z)

        XCTAssertEqual(x, 2)
        XCTAssertEqual(y, 3)
        XCTAssertEqual(z, 1)

        mySwap(&x, &y)
        XCTAssertEqual(x, 3)
        XCTAssertEqual(y, 2)
    }

    func testMySwap2() {
        var x = "100"
        var y = "0"
        mySwap(&x, &y)
        XCTAssertEqual(x, "0")
        XCTAssertEqual(y, "100")
    }

    func testMySwap3() {
        var s = 10
        var t = 20
        mySwap(&s, &t)

        // 戻り値違いはダメ？
//        let flag : Bool = mySwap(&s, b: &t)
//        XCTAssertEqual(flag, true)
    }

    // 外部引数違い
    func testMySwap4() {
        var s = 10, t = 20
        mySwap(little: &s, great: &t)

        XCTAssertEqual(s, 10)
        XCTAssertEqual(t, 20)
    }

    func testSetFont() {
        setFont("RaglanPunch")
        setFont("Courier", bold: true)
        setFont("Times", size: 16.0, bold: false)
        setFont("TImes", bold: true, size: 18.0)
    }

    func testSetGray() {
        setGray()
        setGray(240)
        setGray(128, 0.4)
    }



}
