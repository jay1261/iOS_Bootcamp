//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        storyBrain.nextStory(userAnswer)
        
        updateUI()
    }
    
    func updateUI(){
        // 타이틀 바꾸기
        // 버튼 라벨 바꾸기
        storyLabel.text = storyBrain.getTitleLabel()
        choice1Button.setTitle(storyBrain.getChoices()[0], for: .normal)
        choice2Button.setTitle(storyBrain.getChoices()[1], for: .normal)
    }
}

