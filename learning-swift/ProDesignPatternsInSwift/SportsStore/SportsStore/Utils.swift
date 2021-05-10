//
//  Utils.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2017/01/07.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number: Double) -> String {
        let fomatter = NumberFormatter()
        fomatter.numberStyle = NumberFormatter.Style.currency
        return fomatter.string(from: NSNumber(value: number)) ?? ""
    }
}
