//
//  Section1Tests.swift
//  ProgrammingLanguageSwiftDefinitiveGuide
//
//  Created by 石塚隆一 on 2016/03/27.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import XCTest

class Section1Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCollatz() {
        XCTAssertEqual(collatz(7), 1)

    }

    func testMultiplicationTable1() {
        multiplicationTable1()
    }

    func testPowerOf2() {
        powerOf2()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testList1_5() {
        list1_5()
    }

    func testList1_6() {
        list1_6()
    }

    func testJudgeScore() {
        judge(45)
    }

    func testPrintCalendar() {
        printCalendar()
    }

    func testPrintAndJudgeLeapYear() {
        printAndJudgeLeapYear(1996)
        printAndJudgeLeapYear(2000)
        printAndJudgeLeapYear(2015)
        printAndJudgeLeapYear(2100)
    }

}
