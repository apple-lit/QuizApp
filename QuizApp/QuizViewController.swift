//
//  QuizViewController.swift
//  QuizApp
//
//  Created by KudoRintaro on 2018/09/19.
//  Copyright © 2018年 Rintaro Kudo. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数
    var correctAnswers: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!
    @IBOutlet var choice3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //一時的にクイズを格納しておく配列
        var tempArray = [Any]()
        
        //tempArrayに問題文、選択肢、答えが入った配列を追加
        tempArray.append(["問題文１", "選択肢１", "選択肢２", "選択肢３", 1])
        tempArray.append(["問題文2", "選択肢１", "選択肢２", "選択肢３", 1])
        tempArray.append(["問題文3", "選択肢１", "選択肢２", "選択肢３", 2])
        tempArray.append(["問題文4", "選択肢１", "選択肢２", "選択肢３", 2])
        tempArray.append(["問題文5", "選択肢１", "選択肢２", "選択肢３", 3])
        tempArray.append(["問題文6", "選択肢１", "選択肢２", "選択肢３", 3])
    
    
    //問題をシャッフルしてquizArrayに格納する
        while (tempArray.count > 0){
            let index = Int(arc4random()) % tempArray.count
            quizArray.append(tempArray[index])
            tempArray.remove(at: index)

        }
        
        choiceQuiz()
}
    
    func choiceQuiz(){
        
        //一時的にクイズを取り出す配列
        let tempArray = quizArray[0] as! [Any]
        
        //問題文のテキストを表示
        quizTextView.text = tempArray[0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choice1.setTitle(tempArray[1] as? String, for: .normal)
        choice2.setTitle(tempArray[2] as? String, for: .normal)
        choice3.setTitle(tempArray[3] as? String, for: .normal)
        
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tempArray = quizArray[0] as! [Any]
        
        if tempArray[4] as! Int == sender.tag{
            
            //正解数を増やす
            correctAnswers += 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0{
//            performSegueToResult()
//        }else{
            choiceQuiz()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
