//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by DongJae Lee on 2022/10/20.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue : String?
    var advise: String?
    var color: UIColor?
    
    @IBOutlet weak var adviseLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func setView(){
        bmiLabel.text = bmiValue
        adviseLabel.text = advise
        backgroundImageView.backgroundColor = color
        view.backgroundColor = color
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
