//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by 石塚隆一 on 2017/11/04.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class CarSelector {

    class func selector(passengers: Int) -> String? {
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
//        return car?.name
//        return createRentalCar(passengers: passengers)?.name
        return RentalCar.createRentalCar(passengers: passengers)?.name
    }

}
