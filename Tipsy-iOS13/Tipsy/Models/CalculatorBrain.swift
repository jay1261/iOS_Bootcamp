//
//  BillBrain.swift
//  Tipsy
//
//  Created by DongJae Lee on 2022/11/02.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var bill = Bill(totalbill: 0.0, tip: 0.1, split: 2, result: 0.0)
    
    mutating func setTipValue(_ tipValue: Double){
        self.bill.tip = tipValue
    }
    
    mutating func setSplitValue(_ split: Int){
        self.bill.split = split
    }
    
    mutating func calculateBill(_ totalbill: Double){
        bill.result = (totalbill + (totalbill * bill.tip)) / Double(bill.split)
    }
    
    func getResult() -> Double{
        return bill.result
    }
    
    func getSplit() -> Int{
        return bill.split
    }
    func getTip() -> Double{
        return bill.tip * 100
    }
    
    
}
