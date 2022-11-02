//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipValue = 0.1
    var splitNumber = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        // 처음에 다 꺼진 상태로 초기화
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch (sender){
        case zeroPctButton:
            zeroPctButton.isSelected = true
            calculatorBrain.setTipValue(0.0)
        case tenPctButton:
            tenPctButton.isSelected = true
            calculatorBrain.setTipValue(0.1)
        case twentyPctButton:
            twentyPctButton.isSelected = true
            calculatorBrain.setTipValue(0.2)
        default:
            print("error")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let split = Int(sender.value)
        calculatorBrain.setSplitValue(split)
        splitNumberLabel.text = String(format: "%0.0f", sender.value) //Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        performSegue(withIdentifier: "GoToResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToResult"{
            let resultVC = segue.destination as? ResultViewController
            
            calculatorBrain.calculateBill(Double(billTextField.text ?? "") ?? 0)
            
            
            resultVC?.result = calculatorBrain.getResult()
            resultVC?.split = calculatorBrain.getSplit()
            resultVC?.tip = calculatorBrain.getTip()
        }
    }
}

