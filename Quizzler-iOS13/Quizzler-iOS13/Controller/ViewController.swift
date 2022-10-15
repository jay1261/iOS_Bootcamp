//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    //    let quiz = [
//        ["Four + Two is equal to Six", "True"],
//        ["Five - Three is greater than One", "True"],
//        ["Three + Eight is less than Ten", "False"]
//    ]
    
    var quizBrain = QuizBrain()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if(userGotItRight){
//            print("Right!")
            sender.backgroundColor = UIColor.green
        }
        else{
//            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.newtQuestion()
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//        updateUI()
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
//        let labelTextArr = quizBrain.getLabelText()
        firstButton.setTitle(quizBrain.getLabelText()[0], for: .normal)
        secondButton.setTitle(quizBrain.getLabelText()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getLabelText()[2], for: .normal)
        
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
}

