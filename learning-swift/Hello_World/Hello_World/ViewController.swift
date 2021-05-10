//
//  ViewController.swift
//  Hello_World
//
//  Created by 石塚隆一 on 2014/07/17.
//  Copyright (c) 2014年 石塚隆一. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var label: UILabel

    @IBOutlet var label2: UILabel
    
    @IBOutlet var button1: UIButton

    @IBAction func click(sender: AnyObject) {
        println("button1が押下されました。");
        var world = "world"
        NSLog("test: %@", world)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Hello World!!");
        
        var number: Int16 = 1
        
        var label = UILabel(frame : CGRectMake(100, 200, 200, 20))
        label.text = "Swiftだよん"
        self.label.text = "sdafs"
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

