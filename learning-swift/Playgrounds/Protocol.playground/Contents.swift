//: Playground - https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md

import UIKit

protocol StringConvertible {
    func stringify() -> String
}

struct Something1: StringConvertible {
    func stringify() -> String {
        return "Something1.stringify"
    }
}

struct Something2: StringConvertible {
    func stringify() -> String {
        return "Something2.stringify"
    }
}

extension Array: StringConvertible where Element == StringConvertible {
    func stringify() -> String {
        return self.reduce("") { (result, elem) -> String in
            return result + "/" + elem.stringify()
        }
    }
}

extension Array {
    func test() {

    }
}

let somethings1: [StringConvertible] = [Something1(), Something2()]

print(somethings1.stringify())

let somethings2: [StringConvertible] = [somethings1, Something1(), Something2()]

print(somethings2.stringify())

let something3: [StringConvertible] = [Something1(), somethings1, somethings2]

print(something3.stringify())
