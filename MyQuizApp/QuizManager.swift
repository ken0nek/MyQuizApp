//
//  QuizManager.swift
//  MyQuizApp
//
//  Created by Ken Tominaga on 2014/06/08.
//  Copyright (c) 2014年 Tommy. All rights reserved.
//

import Foundation

class QuizManager: NSObject {
    
    // the array of problems
    var problemArray: Problem[] = [];
    
    // the total number of problems
    var totalProblems: Int = 0
    
    // the index of current problem
    var currentProblem: Int = 0
    
    // the number of correct answers
    var correctAnswers: Int = 0
    
    // Singletonパターン
    class func sharedManager() -> QuizManager {
        
        struct Static{
            static var sharedManager: QuizManager?
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken) {
            Static.sharedManager = QuizManager()
        }
        
        return Static.sharedManager!
    }
    
    init() {
        
    }
    
    // 引数からProblemを生成し、problemArrayに入れる
    func makeProblem(q: String, c1: String, c2: String, c3: String, a: Int) {
        self.problemArray += Problem(q, c1, c2, c3, a)
        self.totalProblems++
    }
    
    func shuffle(var array: Problem[]) -> Problem[] {
        for i in 0..array.count {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            array.insert(array.removeAtIndex(j), atIndex: i)
        }
        
        for element in array {
            let problem: Problem = element as Problem
            println(problem.getQuestionText())
        }
        return array
    }
    
}
