import Cocoa

var a: Int = 0
var b: Int? = 10

// nilは許されない
//a = nil
// nilを許さる
b = nil


let olympic = "2020"

var year: Int? = Int(olympic)
// 失敗のあるイニシャライザ
var city: Int? = Int("Tokyo")

var year2: Optional<Int> = Int("2020")

// 開示（unwrap）
var remain: Int = year! - 2016

do {
    let ww3: Int? = nil
    // fatal error: unexpectedly found nil while unwrapping an Optional value
    // var remain = ww3! - 2016
}

do {
    var year: Int? = Int("2020")
    // 開示指定が必要
    year! -= 1016
    print(year!)
}

do {
    /*
     判定は開示指定が不要。なぜなら、nilのときに開示するとエラーになるから、開示する前に判定できるようにしたため。
     */
    var nagano: Int? = Int("1998")

    // 開示指定を使用しない
    if nagano != nil { // 真になる
        print("Nagano: \(nagano!)") // 開示指定が必要
    }

    // 開示指定を使用しない
    if nagano == 2020 { // 偽になる
        print(2020)
    }

        // 開示していを使わない
    else if nagano == 1998 { // 真になる
        print(1998)
    }

    // nilは、どんな数字や文字列より小さくなる
    var x: Int? = nil
    // swift3からsnilは比較できないくなった？
    //x < 2000

}


do {
    let year: Int? = Int("2020")

    // if-let
    // yearが、nilでないなら、真となり、開示されて、yに代入される
    if let y = year {
        print("あと\(y - 2014)年") // yは、Int型、開示指定不要。
    } else {
        // 定数yはここでは使えない。どっちみちnilだから。
        print("エラー")
    }

    // if-var
    if var y = Int("2020") {
        y -= 2014 // 開示指定が必要だが、nilではない保証があるから、問題ない。
    } else {
        print("エラー")
    }

    // 複数個
    if let sapporo = Int("1972"), let nagano = Int("1998") {
        print("\(nagano - sapporo)years.")
    }

    // 複数個（型違い）
    if let sapporo = Int("1972"), var n = Int("1998") {
        n -= sapporo
        print("\(n)year.")
    }

    var y = Int("2020")
    // エラー。nilかもしれないので、演算できない。
    // y -= 2014


    let nagano = 1998
    // 条件式と一緒に、オプショナル束縛つかう
    if nagano < 2000, let tokyo = Int("2020"), tokyo < 2000 {
        print("tokyo: \(tokyo)")
    }

    let stock = ["01", "2", "4", "05", "8", "q", "X"]
    for str in stock {

        guard let v = Int(str) else {
            print(str + "??")
            // ブロックを抜けるものが必要
            break
        }

        // if-letと違い、vを利用できる
        print(v, terminator: " ")
    }

}
