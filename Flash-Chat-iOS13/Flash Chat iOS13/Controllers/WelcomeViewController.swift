//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// ---------------- for loop animation ----------------
        let titleString = "⚡️FlashChat"
        var index: Double = 0.0
        titleLabel.text = ""
        for letter in titleString {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            index += 1
        }
//-----------------------------------------------------
        
        

    }
    

}
