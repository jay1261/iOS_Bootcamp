//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
//
    var count = 30
    var totalTime = 0
    var timer : Timer?
    var player : AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        count = eggTimes[hardness] ?? 0
        totalTime = eggTimes[hardness] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        
//        switch(hardness){
//        case "Soft":
//            print(eggTimes[hardness] ?? "error")
//            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//        case "Medium" :
//            print(eggTimes[hardness]!)
//
//        case "Hard":
//            print(eggTimes[hardness])
//
//        default:
//            print("no")
//        }
    }
    
    @objc func updateCounter(){
        if(count > 0){
            print(count)
            progressBar.progress = (Float(1.0) - (Float(count) / Float(totalTime)))
            count -= 1
        }
        else{
            timer?.invalidate()
            titleLabel.text = "DONE!"
            progressBar.progress = 1.0
            
            //player
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else{ return }
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
            
        }
    }
}
