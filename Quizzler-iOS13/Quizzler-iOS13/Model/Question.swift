//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by DongJae Lee on 2022/10/14.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    let text: String
    let answer: [String]
    let correctAnswer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
    
}

