//
//  Page1ViewController.swift
//  TestApplication
//
//  Created by GrandFunk on 2017/4/27.
//  Copyright © 2017年 GrandFunk. All rights reserved.
//

import Foundation
import UIKit

class Page1ViewController : UIViewController {
        
    let 所有問題:[String] = [
        "(1) 2分之1 跟 10分之5 一樣嗎？",
        "(2) 5/6 和 6/5 一樣嗎?",
        "(3) 10/5 和 5/2.5 一樣嗎 ?"
    ]
    
    var 第幾題 = -1

    @IBOutlet weak var 問題: UILabel!
    @IBOutlet weak var 叉叉: UILabel!
    @IBOutlet weak var 勾勾: UILabel!
    @IBOutlet weak var yes1: UIButton!
    @IBOutlet weak var no1: UIButton!

    override func viewDidLoad() {
        下一題()
    }
    
    @IBAction func yes1按(_ sender: UIButton) {
        勾勾.isHidden = false
        self.yes1.isEnabled = false
        self.no1.isEnabled = false
        delay()
    }
    
    
    @IBAction func no1按(_ sender: UIButton) {
        叉叉.isHidden = false
        self.yes1.isEnabled = false
        self.no1.isEnabled = false
        delay()
    }
    
    func 下一題() {
        if 第幾題 < 所有問題.count - 1 {
            第幾題 += 1
        }
        問題.text = 所有問題[第幾題]
        勾勾.isHidden = true
        叉叉.isHidden = true
        self.yes1.isEnabled = true
        self.no1.isEnabled = true
    }
    
    func delay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.下一題()
        })
    }
}

