//
//  Problem.swift
//  MyQuizApp
//
//  Created by Ken Tominaga on 2014/06/07.
//  Copyright (c) 2014年 Tommy. All rights reserved.
//

import Foundation

class Problem: NSObject {

    var questionText: String = ""
    var firstChoise: String = ""
    var secondChoise: String = ""
    var thirdChoise: String = ""
    
    var answerNumber: Int = 0
    
    init() {
        
    }
    
    init(_ q: String, _ c1: String, _ c2: String, _ c3: String, _ a: Int) {
        self.questionText = q
        self.firstChoise = c1
        self.secondChoise = c2
        self.thirdChoise = c3
        
        self.answerNumber = a
    }
    
    func getQuestionText() -> String {
        return self.questionText
    }
    
    func getChoises() -> (String, String, String) {
        return (self.firstChoise, self.secondChoise, self.thirdChoise)
    }
    
    func getAnswer() -> (Int) {
        return self.answerNumber
    }
}
