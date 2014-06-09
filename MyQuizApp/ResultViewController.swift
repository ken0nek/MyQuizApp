//
//  ResultViewController.swift
//  MyQuizApp
//
//  Created by Ken Tominaga on 2014/06/07.
//  Copyright (c) 2014年 Tommy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let QMGR: QuizManager = QuizManager.sharedManager()
    
    var correctPercentage: Int = 0
    
    @IBOutlet var percentageLabel: UILabel
    @IBOutlet var levelLabel: UILabel
    @IBOutlet var levelImageView: UIImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 正答率を計算する
        correctPercentage = QMGR.correctAnswers * 100 / QMGR.totalProblems
        
        // 正答率に応じて表示を変える
        if correctPercentage < 30 {
            levelLabel.text = "だめ"
            levelImageView.image = UIImage(named: "")
        } else if correctPercentage >= 30 && correctPercentage < 90 {
            levelLabel.text = "ふつう"
            levelImageView.image = UIImage(named: "")
        } else {
            levelLabel.text = "かみ"
            levelImageView.image = UIImage(named: "")
        }
        
        // 実際の正答率を表示する
        percentageLabel.text = "\(correctPercentage)%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop() {
        self.presentingViewController.presentingViewController.dismissViewControllerAnimated(false, completion:nil)
    }
    
}
