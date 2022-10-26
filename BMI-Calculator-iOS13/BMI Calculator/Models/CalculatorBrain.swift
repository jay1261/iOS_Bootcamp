//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by DongJae Lee on 2022/10/20.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit
    
struct CalculatorBrain{
    
//    var bmi: Float?
    var bmi: BMI?
    
    mutating func calculateBMI(height:Float, weight:Float){
        let bmiValue = weight / pow(height, 2)
        let color = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) , #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) , #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) ]
        if bmiValue <= 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: color[0])
        }
        else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color[1])
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: color[2])
        }
    }
    
    func getBMIValue() -> String{
// optional binding 옵셔널 바인딩
//        if let safeBMI = bmi{
//            return String(format: "%.1f", safeBMI)
//        }
//        else{
//            return "bmi is nil"
//        }
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvise() -> String {
        return bmi?.advice ?? "nil"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

