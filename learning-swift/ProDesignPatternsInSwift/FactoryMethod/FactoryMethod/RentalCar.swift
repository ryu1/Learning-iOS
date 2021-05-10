//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by 石塚隆一 on 2017/11/04.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

//func createRentalCar(passengers: Int) -> RentalCar? {
//    var car: RentalCar?
//    switch (passengers) {
//    case 0 ... 1:
//        car = Sports()
//    case 2 ... 3:
//        car = Compact()
//    case 4 ... 8:
//        car = SUV()
//    case 9...14:
//        car = Minivan()
//    default:
//        car = nil
//    }
//    return car
//}
//
//protocol RentalCar {
//    var name: String { get }
//    var passengers: Int { get }
//    var pricePerDay: Float { get }
//}
//
//class Compact : RentalCar {
//    var name = "VM Golf"
//    var passengers = 3
//    var pricePerDay: Float = 20
//}
//
//class Sports : RentalCar {
//    var name = "Porsche Boxter"
//    var passengers: Int = 1
//    var pricePerDay: Float = 100
//}
//
//class SUV : RentalCar {
//    var name: String = "Cadillac Escalade"
//    var passengers: Int = 8
//    var pricePerDay: Float = 75
//}
//
//class Minivan : RentalCar {
//    var name: String = "Chevrolet Express"
//    var passengers: Int = 14
//    var pricePerDay: Float = 40
//}


class RentalCar {

    private var nameBV: String
    private var passengersBV: Int
    private var priceBV: Float

    fileprivate init(name: String, passengers: Int, price: Float) {
        self.nameBV = name
        self.passengersBV = passengers
        self.priceBV = price
    }

    final var name: String {
        get { return nameBV }
    }

    final var passengers: Int {
        get { return passengersBV}
    }

    final var pricePerDay: Float {
        get { return priceBV }
    }

    class func createRentalCar(passengers: Int) -> RentalCar? {
//        var car: RentalCar?
//        switch (passengers) {
//        case 2 ... 3:
//            car = Compact()
//        case 4 ... 8:
//            car = SUV()
//        default:
//            car = nil
//        }
//        return car
        var carImpl: RentalCar.Type?
        switch (passengers) {
        case 2 ... 3:
            carImpl = Compact.self
        case 4 ... 8:
            carImpl = SUV.self
        default:
            carImpl = nil
        }
        return carImpl?.createRentalCar(passengers:passengers)

    }
}

class Compact : RentalCar {
//    init() {
//        super.init(name: "VM Golf", passengers: 3, price: 20)
//    }

    private convenience init() {
        self.init(name: "VM Golf", passengers: 3, price: 20)
    }

    fileprivate override init(name: String, passengers: Int, price: Float) {
        super.init(name: name, passengers: passengers, price: price)
    }

    override class func createRentalCar(passengers: Int) -> RentalCar? {
        if (passengers < 2) {
            return Compact()
        } else {
            return SmallCompact()
        }
    }
}

class SmallCompact : Compact {
    fileprivate init() {
        super.init(name: "Ford Fiesta", passengers: 3, price: 15)
    }
}

class SUV : RentalCar {
//    init() {
//        super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
//    }

    private init() {
        super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
    }

    override class func createRentalCar(passengers: Int) -> RentalCar? {
        return SUV()
    }
}
