//
//  C.swift
//  ProgrammingLanguageSwiftDefinitiveGuide
//
//  Created by 石塚隆一 on 2016/03/27.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import Foundation


func collatz(_ integer: Int) -> Int {
    var n = integer
    repeat {
        print("\(n) ", terminator: "")
        if n % 2 == 0 {
            n /= 2
        } else {
            n = n * 3 + 1
        }
    } while n > 1
    print(n)
    return n
}

func multiplicationTable1() {
    for var i = 1; i <= 9; i += 1 {
        var line = ""

        for var j = 1; j <= 9; j += 1 {
            let n = i * j

            if n < 10 {
                line += " \(n)"
            }

            print(line)
        }
    }

}

func powerOf2() {
//    for var i = 0, m = 1; i < 32; i += 1, m *= 2 {
    for var i = 0, m = 1; i < 32; i += 1, m *= 2 {
        print("\(i) \(m)")
    }
}

func list1_5() {

    for i in 1 ..< 64 where i % 3 != 0 && i % 8 != 0 {
        print(i, terminator: " ")
    }
    print("")

}

func list1_6() {
    for n in 2 ... 10 {
        for s in ["♠", "♡", "♣", "♢"] {
            print("\(s)\(n)", terminator: "")
        }
        print("\n")
    }
    print("")
}

func judge(_ score: Int) {

    let red = 45

    switch score {

    case red..<75:
        print("追試験")
    case 90...100:
        print("秀")
    case 80..<90:
        print("優")
    case 70..<80:
        print("良")
    case 60..<70:
        print("可")
    default:
        print("不可")
    }
}

func printCalendar() {
    let days = 31
    let firstDay = 2
    var w = 0

    for ; w < firstDay; w+=1 {
        print("   ", terminator: "")
    }

    var d = 1

    loop: while true {
        for ; w < 7; w+=1 {

            let pad = d < 10 ? " " : ""

            print(pad + " \(d)", terminator: "")

            let nextD = d + 1
            d+=1

            if nextD > days {
                print("")

                break loop
            }
        }
        print("")
        w = 0
    }
}

func printAndJudgeLeapYear(_ year: Int) {
    leap: if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                print("\(year)年は400で割り切れるので閏年です。")
                break leap
            }
            print("\(year)年は100で割り切れるので閏年ではありません。")
            break leap
        }
        print("\(year)年は4で割り切れるので閏年です。")
    } else {
        print("\(year)年は4で割り切れないので閏年ではありません。")
    }

}
