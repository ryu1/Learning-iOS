//
//  Section3.swift
//  ProgrammingLanguageSwiftDefinitiveGuide
//
//  Created by 石塚隆一 on 2016/05/05.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import Foundation

struct Date {
    var year: Int = 2010
    var month: Int = 7
    var day: Int = 28

}

struct Date1 {
    var year: Int
    var month: Int
    var day: Int

    init() {
        self.year = 2095
        month = 10
        day = 31
    }

    static func isLeap(_ y: Int) -> Bool {
        return (y % 4 == 0) && (y % 100 != 0 || y % 400 == 0)
    }

    static func daysOfMonth(_ m: Int, year: Int) -> Int {
        switch m {
        case 2: return isLeap(year) ? 29 : 28
        case 4, 6, 9, 11: return 30
        default: return 31
        }

    }

}

func printDate() {
    var d = Date()

    print(d.year)

    d.day = 29

    let camp = Date(year: 1998, month: 8, day: 8)
    print(camp)

    let event = Date(year: 2000, month: 9, day: 13)
    print(event)
//    event.year = 2010
}

struct Time {
    let in24h: Bool = false
    var hour = 0
    var min = 0
}

struct Time1 {
    let in24h: Bool
    var hour = 0
    var min = 0

    init(hour: Int, min: Int) {
        in24h = false
        self.hour = hour
        self.min = min
    }

    init(hourIn24 h: Int) {
        in24h = true
        hour = h
    }

    init(_ hour: Int) {
        self.init(hourIn24: hour)
    }

}

struct Time3 {
    let hour: Int
    let min: Int

    func add(_ min: Int) -> Time3 {
        var m = self.min + min
        var h = self.hour
        if 60 <= m {
            h = (h + m / 60) % 24
            m %= 60
        }
        return Time3(hour: h, min: m)
    }

    func toString() -> String {
        let h = hour < 10 ? " \(hour)" : "\(hour)"
        let m = min < 10 ? " \(min)" : "\(min)"
        return h + ":" + m
    }

}

func printTime() {
    let t1 = Time()
    print(t1)
//    var t2 = Time(in24h: true, hour: 7, min: 0)
    let t2 = Time(hour: 7, min: 0)
    print(t2)

//    var t3 = Time1()
//    var t3 = Time1(in24h: true, hour: 7, min: 0)
//    print(t3)

    _ = Time1(hour: 10, min: 30)
    _ = Time1(hourIn24: 15)
    _ = Time1(1)
//    var d = Time1()
//    var e = Time1(in24h: true, hour: 13, min: 30)


    let t31 = Time3(hour: 22, min: 45)
    let t32 = t31.add(140)
    print(t31.toString())
    print(t32.toString())
}

struct DateWithTime {
    var date = Date1()
    var time = Time1(hour: 0, min: 15)
}

func printDateWithTime() {
    let u = DateWithTime()
    print(u.date.year)
    print(u.time.min)
}

struct SimpleTime {
    var hour: Int
    var min: Int

    init(_ hour: Int, _ min: Int) {
        self.hour = hour
        self.min = min
    }
}

struct PointOfTime {
    struct Date {
        var year: Int
        var month: Int
        var day: Int
    }

    typealias Time = SimpleTime

    var date: Date
    var time: Time

    init(year: Int, month: Int, day: Int, hour: Int, min: Int) {
        date = Date(year: year, month: month, day: day)
        time = Time(hour, min)
    }
}

func printPointOfTime() {
    var a = PointOfTime(year: 2034, month: 11, day: 7, hour: 14, min: 55)
    print(a.date.month)
    print(a.time.min)
    let b = PointOfTime.Date(year: 2022, month: 11, day: 6)
    print(b.year)
    a.time = PointOfTime.Time(10, 21)
    print(a.time.hour)
}

struct Clock {
    var hour: Int
    var min: Int

    mutating func advance(_ min: Int) {
        let m = self.min + min

        if 60 <= m {
            self.min = m % 60
            let t = self.hour + m / 60
            self.hour = t %  24
        } else {
            self.min = m
        }
    }

    mutating func inc() {
        self.advance(1)
    }

    func toString() -> String {
        let h = hour < 10 ? " \(hour)" : "\(hour)"
        let m = min < 10 ? " \(min)" : "\(min)"
        return h + ":" + m
    }

}

func printClock() {
    var tic = Clock(hour: 19, min: 40)
    tic.advance(19)
    tic.inc()
    print(tic.toString())
}

struct DateWithString {
    let string: String
    let year: Int
    let month: Int
    let day: Int

    static let mons = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    static var longFormat = false

    init(_ y: Int, _ m: Int, _ d: Int) {
        year = y
        month = m
        day = d

//        string = "\(y)-" + DateWithString.twoDigits(m) + "-" + DateWithString.twoDigits(d)

        string = DateWithString.longFormat ? DateWithString.longString(y, m, d) : DateWithString.shortString(y, m, d)

    }

//  func twoDigits(n: Int) -> String {
//      let i = n % 100
//      return i < 10 ? "0\(i)" : "\(i)"
//  }

    static func twoDigits(_ n: Int) -> String {
        let i = n % 100
        return i < 10 ? "0\(i)" : "\(i)"
    }

    static func longString(_ y: Int, _ m: Int, _ d: Int) -> String {
        return "\(y)-" + twoDigits(m) + "-" + self.twoDigits(d)
    }

    static func shortString(_ y: Int, _ m: Int, _ d: Int) -> String {
        return twoDigits(d) + mons[m - 1] + twoDigits(y)
    }

}

func printDateWithString() {
    let an1 = DateWithString(2016, 6, 22)
    print(an1.string)

    let a = DateWithString(2015, 1, 20)
    print(a)
    DateWithString.longFormat = true
    let b = DateWithString(2025, 1, 21)
    print(b.string)
}

var serialNumber = 2127

struct LCD {

    struct Size {
        var width: Int
        var height: Int
    }

    static var stdHeight = 1080
    static var stdWidth = 1920
    static var stdSize = Size(width: stdWidth, height: stdHeight)

    var size: Size

    let serial = "CZ:\(serialNumber += 1)"

    init(_ w: Int, _ h: Int) {
        size = Size(width: w, height: h)
    }
}

func printLCD() {
    let small = LCD(800, 600)
    print(small.serial)

    LCD.stdHeight = 1200
    print(LCD.stdSize)
    LCD.stdWidth = 2560
    print(LCD.stdSize)
}

struct Ounce {

    var mL: Double = 0.0

    static let ounceUS = 29.5735

    var ounce: Double {
        get {
            return mL / Ounce.ounceUS
        }
        set {
            mL = newValue * Ounce.ounceUS
        }

    }

    init(ounce: Double) {
        self.ounce = ounce
    }

}

func printOunce() {
    var a = Ounce(ounce: 2.0)
    print(a.ounce)
    print(a.mL)

    a.ounce += 8.0

    print(a.ounce)
}

func printSwapOunce() {
    var a = Ounce(ounce: 2.0)
    var b = Ounce(ounce: 10.0)
    print("\(a.mL)mL, \(b.mL)mL")

    swap(&a, &b)
    print("\(a.mL)mL, \(b.mL)mL")

    swap(&a.mL, &b.mL)
    print("\(a.mL)mL, \(b.mL)mL")

    swap(&a.ounce, &b.ounce)
    print("\(a.ounce)oz, \(b.ounce)oz")

    var z: Double = 0.1
    swap(&a.ounce, &z)
    print("\(a.ounce)oz, \(z)")

}


struct ValueWithCounter {

    fileprivate let _value: Double

    var count = 0

    var value: Double {

        mutating get {
            count += 1
            return _value
        }

    }

    init(_ v: Double) {
        _value = v
    }

}

struct ValueInLine {

    fileprivate static var _pool: [Double] = []

    let index: Int

    init(_ v: Double) {
        index = ValueInLine._pool.count
        ValueInLine._pool.append(v)
    }

    var value: Double {
        get {
            return ValueInLine._pool[index]
        }

        nonmutating set {
            ValueInLine._pool[index] = newValue
        }
    }

    static func clear() {
        for i in 0 ..< _pool.count {
            _pool[i] = 0.0
        }
    }

}

import Cocoa

var landscape: Bool {
    let size = NSScreen.main()!.frame.size
    return size.width > size.height
}


struct Stock {
    let buyingPrice: Int

    var high = false
    var count = 0
    var price: Int {
        willSet {
            count += 1
            high = newValue > buyingPrice
        }
        didSet {
            print("\(oldValue) => \(price)")
        }
    }

    init(price: Int) {
        buyingPrice = price
        self.price = price
    }

}

struct FoodMenu {

    let menu = ["ざる", "かけ", "たぬき"]

    var submenu = ["とろろ", "天ぷら", "南ばん"]

    let count = 6

    // 添字付きアクセス
    subscript (i: Int) -> String {

        get {
            return i < 3 ? menu[i] : submenu[i - 3]
        }

        set {
            if i > 2 && i < 6 {
                submenu[i - 3] = newValue
            }
        }
    }
}

// List 3-21
struct Time4: CustomStringConvertible {
    let hour: Int
    let min: Int

    func add(_ min: Int) -> Time4 {
        var m = self.min + min
        var h = self.hour
        if 60 <= m {
            h = (h + m / 60) % 24
            m %= 60
        }
        return Time4(hour: h, min: m)
    }

    var description: String {
        let h = hour < 10 ? " \(hour)" : "\(hour)"
        let m = min < 10 ? "0\(min)" : "\(min)"
        return h + ":" + m
    }
// swiftlint:disable file_length
}
