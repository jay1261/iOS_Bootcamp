//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by DongJae Lee on 2022/10/20.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    
    var bmiValue = ""
    
    mutating func calculateBMI(height:Float, weight:Float){
        let bmi = weight / pow(height, 2)
        self.bmiValue = String(format: "%.1f", bmi)
    }
    
    func getBMIValue() -> String{
        return bmiValue
    }
}
