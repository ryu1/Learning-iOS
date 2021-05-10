// Playground - noun: a place where people can play

import Cocoa

enum MyEnum {
    case One
    case Two
    case Three
}

class MyClass {

}

struct MyStruct {

}


class Object {

    var string: String?

    var number: Int = 0

    var b: Bool {
        return false
    }

    private let dic: [String: Any] = ["key": "value", "a": "b"]

    var arr: [Int] = [1, 2, 3, 4, 5]

    var any: AnyObject?

    var e: MyEnum = .One

    var c: MyClass = MyClass()

    private(set) var s: MyStruct = MyStruct()

    let tuple: (label: String, value: Int) = (label: "AGE", value: 23)

    var closure: (Void) -> Void = {}

    lazy var lString: String = {
        return "lazy"
    }()

    lazy var lNumber: Int = 1

    func method() {
        print("hogehoge")
    }

    class func method() -> String {
        return "fugafuga"
    }

}

let object = Object()
let mirror = Mirror(reflecting: object)

print("mirror: \(mirror)")
print("children: \(mirror.children)")
print("subjectType: \(mirror.subjectType)")
print("displayStyle: \(mirror.displayStyle)")
print("description: \(mirror.description)")
print("")

mirror.children.map {
    print("\($0.label!) => \($0.value)\n")
}


@objc(Foo)
class Foo: NSObject {

    func bar() {

        print("bar")

    }

}


// tailor:off
var cls: NSObject.Type = NSClassFromString("Foo") as! NSObject.Type
var foo: Foo = cls.init() as! Foo
// tailor:on

foo.bar()    // -> `bar` が出力される

@objc(TestClass)
class TestClass: NSObject {

    func test() -> Void {
        print("Hello")
    }

}

let test = TestClass()

let aSel: Selector = NSSelectorFromString("test")

test.perform(aSel, on: Thread.current, with: nil, waitUntilDone: true)
