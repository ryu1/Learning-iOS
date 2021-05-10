//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by 石塚隆一 on 2017/11/04.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class PriceCalculator {

    class func calculatePrice(passengers: Int, days: Int) -> Float? {
//        var car: RentalCar?
//        switch (passengers) {
//        case 0 ... 1:
//            car = Sports()
//        case 2 ... 3:
//            car = Compact()
//        case 4 ... 8:
//            car = SUV()
//        case 9...14:
//            car = Minivan()
//        default:
//            car = nil
//        }
//        return car == nil ? nil : car!.pricePerDay * Float(days)

//        var car: RentalCar? = createRentalCar(passengers: passengers)
//        return car == nil ? nil : car!.pricePerDay * Float(days)

        let car: RentalCar? = RentalCar.createRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
