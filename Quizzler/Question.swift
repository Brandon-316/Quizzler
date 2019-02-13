//
//  Question.swift
//  Quizzler
//
//  Created by Brandon Mahoney on 2/11/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


class Question {
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.question = text
        self.answer = correctAnswer
    }
}

