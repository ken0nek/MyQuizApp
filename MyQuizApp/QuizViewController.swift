//
//  QuizViewController.swift
//  MyQuizApp
//
//  Created by Ken Tominaga on 2014/06/07.
//  Copyright (c) 2014年 Tommy. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var QMGR: QuizManager = QuizManager.sharedManager()
    
    @IBOutlet var questionTextView: UITextView
    @IBOutlet var firstChoiseLabel: UILabel
    @IBOutlet var secondChoiseLabel: UILabel
    @IBOutlet var thirdChoiseLabel: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 問題の追加方法
        // QMGR.makeProblem("問題文", c1: "選択肢1", c2: "選択肢2", c3: "選択肢3", a: 正解番号[1, 2, 3])
        QMGR.makeProblem("あ", c1: "a", c2: "b", c3: "c", a: 1)
        QMGR.makeProblem("い", c1: "a", c2: "b", c3: "c", a: 2)
        QMGR.makeProblem("う", c1: "a", c2: "b", c3: "c", a: 3)
        QMGR.makeProblem("え", c1: "a", c2: "b", c3: "c", a: 1)
        
        // works fine in console, but...
        QMGR.shuffle(QMGR.problemArray)
        
        if QMGR.totalProblems > 0 {
            self.showProblem(QMGR.currentProblem)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // problemArrayの引数番目を表示する
    func showProblem(index: Int) {
        let problem: Problem = QMGR.problemArray[index];
        questionTextView.text = problem.getQuestionText();
        firstChoiseLabel.text = problem.getChoises().0
        secondChoiseLabel.text = problem.getChoises().1
        thirdChoiseLabel.text = problem.getChoises().2
    }
    
    // 選択肢ボタンが押された時の処理
    @IBAction func didChoisesPressed(button: UIButton) {
        let index: Int = button.tag
        let problem: Problem = QMGR.problemArray[QMGR.currentProblem];
        if problem.getAnswer() == index {
            QMGR.correctAnswers++
        }
        
        self.nextProblem()
    }

    // 次の問題を表示する(最終問題の場合は結果画面へ)
    func nextProblem() {
        QMGR.currentProblem++
        
        if QMGR.currentProblem < QMGR.totalProblems {
            self.showProblem(QMGR.currentProblem)
        } else {
            self.performSegueWithIdentifier("goResultView", sender: self)
        }
    }
}
