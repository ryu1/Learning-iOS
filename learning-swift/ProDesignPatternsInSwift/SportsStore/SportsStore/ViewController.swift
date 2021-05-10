//
//  ViewController.swift
//  SportsStore
//
//  Created by 石塚隆一 on 2016/12/11.
//  Copyright © 2016年 石塚隆一. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockFeild: UITextField!

    var product: Product?
}

//var handler = { (p: Product) in
//    //println("Change: \(p.name) \(p.stockLevel) items in stock")
//    print("Change: \(p.name) \(p.stockLevel) items in stock", terminator: "\n")
//}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var totalStockLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!

    var productStore = ProductDataStore()

//    var products = [
//
//        Product(name: "kayak", description: "A boat for one person", category: "Watersports", price: 270.0, stockLevel: 10),
//
//        Product(name: "Lifejacket", description: "Protective and fashionable", category: "Watersports", price: 48.95, stockLevel: 14),
//
//        Product(name: "Soccer Ball", description: "FIFA-approved size and weight", category: "Soccer", price: 19.5, stockLevel: 32),
//
//        Product(name: "Corner Flags", description: "Give your playing feild a professional touch", category: "Soccer", price: 7900.0, stockLevel: 4),
//
//        Product(name: "Thinking Cap", description: "Improve your brain efficiency by 75%", category: "Chess", price: 16.0, stockLevel: 8),
//
//        Product(name: "Unsteady Chair", description: "Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel: 3),
//
//        Product(name: "Human Chess Board", description: "A fun game for the family", category: "Watersports", price: 270.0, stockLevel: 10),
//
//        Product(name: "Bling-Bling King", description: "Gold-plated, diamond-studded King", category: "Chess", price: 1200.0, stockLevel: 4)
//        ]

//    let logger = Logger<Product>(callback: handler)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayStockTotal()

        ProductDataStore.callback = { (p: Product) in
            for cell in self.tableView.visibleCells {
                if let pcell = cell as? ProductTableCell {
                    if pcell.product?.name == p.name {
                        pcell.stockStepper.value = Double(p.stockLevel)
                        pcell.stockField.text = String(p.stockLevel)
                    }
                }
            }
            displayStockTotal()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayStockTotal() {

        let finalTotals: (Int, Double) = productStore.products.reduce((0, 0.0)) { (totals, product) -> (Int, Double) in
            return (totals.0 + product.stockLevel, totals.1 + product.stockValue)
        }

        totalStockLabel.text = "\(finalTotals.0) Products In Stock. " + "Total Value: \(Utils.currencyStringFromNumber(number: finalTotals.1))"

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productStore.products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        cell.product = product
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.productDescription
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockFeild.text = String(product.stockLevel)
        cell.product = products[indexPath.row]
        return cell
    }

    @IBAction func stockLevelDidChanged(_ sender: Any) {

        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableCell {
                    if let product = cell.product {

                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
                        } else if let textFeild = sender as? UITextField {
                            if let newValue = Int(textFeild.text!) {
                                product.stockLevel = newValue
                            }
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockFeild.text = String(product.stockLevel)
                        productLogger.logItem(item: product)
                    }
                    break
                }
            }
            displayStockTotal()
        }
    }
}

