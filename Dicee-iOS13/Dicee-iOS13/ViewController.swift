//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
    var leftDiceNumber = 1;
    var rightDiceNumber = 5;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        diceImageView1.image =  UIImage(imageLiteralResourceName: "DiceSix")
        
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceTwo")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        if leftDiceNumber > 5 {leftDiceNumber = 0}
        if rightDiceNumber < 0 {rightDiceNumber = 5}
        diceImageView1.image = [ #imageLiteral(resourceName: "DiceOne"),  #imageLiteral(resourceName: "DiceTwo"),  #imageLiteral(resourceName: "DiceThree"),  #imageLiteral(resourceName: "DiceFour"),  #imageLiteral(resourceName: "DiceFive"),  #imageLiteral(resourceName: "DiceSix")][leftDiceNumber]
        diceImageView2.image = [ #imageLiteral(resourceName: "DiceOne"),  #imageLiteral(resourceName: "DiceTwo"),  #imageLiteral(resourceName: "DiceThree"),  #imageLiteral(resourceName: "DiceFour"),  #imageLiteral(resourceName: "DiceFive"),  #imageLiteral(resourceName: "DiceSix")][rightDiceNumber]
        leftDiceNumber += 1
        rightDiceNumber -= 1
    }
    
}

