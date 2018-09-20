//
//  ResultViewController.swift
//  QuizApp
//
//  Created by KudoRintaro on 2018/09/19.
//  Copyright © 2018年 Rintaro Kudo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswers : Int = 0
    
    //結果を表示数ラベル
    @IBOutlet var resultLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(correctAnswers)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //タイトルへ戻るボタン
    @IBAction func back(){
        
        self.presentingViewController?.presentingViewController?
        .dismiss(animated: true, completion: nil)
        
    }

}
