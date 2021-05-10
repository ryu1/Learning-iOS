//
//  Section2.swift
//  2章
//
//  Created by 石塚隆一 on 2016/03/19.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import Foundation

class Sample {

    func isTriangle(_ a: Float, b: Float, c: Float) -> Bool {
        if a > b && a > c {
            return a < b + c
        } else if b > a && b > c {
            return b < a + c
        } else {
            return c < a + b
        }
    }

}

func mySwap(_ a: inout Int, _ b: inout Int) {
    let t = a
    a = b
    b = t
}

// 外部仮引数指定なし
func area1(_ h: Double, w: Double) -> Double {
    return h * w
}

// 外部仮引数指定あり
func area2(height h: Double, width w: Double) -> Double {
    return h * w
}

// swift 2.0から#は仕様できない?
// func area3(#height: Double, #width: Double) -> Double {
//     return height * width
// }

// 第２外部仮引数指定を省略
func area4(_ height: Double, _ width: Double) -> Double {
    return height * width
}

func charge(_ piece: Int, logo: Int = 0, ruby: Int = 0) -> Int {
    var w = 2500
    if piece > 100 {
        w += (piece - 1) / 100 * 600
    }
    return w + logo * 500 + ruby * 100
}


func dayOfWeek1(_ m: Int, d: Int, year y: Int = 2015) -> Int {
    let leap = y + y / 4 - y / 100 + y / 400
    return (leap + (13 * m + 8) / 5 + d) % 7
}


func dayOfWeek2(_ m: Int, d: Int, year y: Int = 2015) -> Int {
    var m = m, y = y
    if m < 3 {
        m += 12; y -= 1
    }

    let leap = y + y / 4 - y / 100 + y / 400
    return (leap + (13 * m + 8) / 5 + d) % 7
}

func printMonth(_ firstDay: Int, days: Int) {

    func printDay(_ d: Int) {
        if d <= 0 {
            print("    ")
        } else {
            print(d < 10 ? "    \(d)" : "  \(d)")
        }

        var d = 1 - firstDay

        while d <= days {
            for _ in 0 ..< 7 {
                printDay(d)
                d += 1
                if d > days {
                    break
                }
            }
            print("\n")
        }
    }

}

// 引数の数違い
func mySwap(_ a: inout Int, _ b: inout Int, _ c: inout Int) {
    let t = a
    a = b
    b = c
    c = t
}

// 引数の型違い
func mySwap(_ a: inout String, _ b: inout String) {
    let t = a
    a = b
    b = t
}

// 戻り値違い
// func mySwap(inout a: Int, inout b: Int) -> Bool {
//     if a == b {
//         return false
//     }
//
//     let t = a; a = b; b = t
//     return true
// }

func mySwap(little a: inout Int, great b: inout Int) {
    if a > b {
        let t = a
        a = b
        b = t
    }
}

let fontSize: Float = 12.0

func setFont(_ name: String, size: Float = fontSize, bold: Bool = false) {
    print("\(name) \(size)" + (bold ? " [B]" : ""))
}

func setGray(_ level: Int = 255, _ alpha: Float = 1.0) {
    print("Gray=\(level), Alpha=\(alpha)")
}

func printMonth(_ firstDay: Int, _ days: Int) {

    func daystr(_ d: Int) -> String {
        if d <= 0 {
            return "    "
        } else {
            return (d < 10 ? "   \(d)" : "  \(d)")
        }
    }

    var d = 1 - firstDay

    while d <= days {
        var line = ""
        for _ in 0..<7 {
            line += daystr(d)
            d += 1
            if d > days { break }
        }
        print(line)
    }


}
