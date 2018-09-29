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
    
    //正誤判定のマルバツ
    @IBOutlet var correctOrWrong: UIImageView!
    
    
    
    
    //選択肢のボタン
    
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!
    @IBOutlet var choice3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //一時的にクイズを格納しておく配列
        var tempArray = [Any]()
        
        //tempArrayに問題文、選択肢、答えが入った配列を追加
        tempArray.append(["Didactic", "教訓的な", "活発的な", "補佐的な", 1])
        tempArray.append(["Fortuitous", "偶然の", "愉快な", "残酷な", 1])
        tempArray.append(["Alacrity", "苦しみ", "素早さ", "物欲", 2])
        tempArray.append(["Hegemony", "敵情", "覇権", "勇気", 2])
        tempArray.append(["Linchpin", "先行き", "点滴", "輪止め", 3])
        tempArray.append(["Ostracism", "猶予", "リストラ", "追放", 3])
        tempArray.append(["Panacea", "救世主", "万能薬", "暗点", 2])
        tempArray.append(["Promulgate", "公布", "招待", "宣伝", 1])
        tempArray.append(["Quixotic", "楽観的な", "中心的な", "非現実的な", 3])
        tempArray.append(["Vociferous", "騒々しい", "究極の", "先天的な", 1])
    
    
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
        quizTextView.text = tempArray[0] as? String
        
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
            correctOrWrong.image = UIImage(named:"correct.png")
           
        }else{
            correctOrWrong.image = UIImage(named:"wrong.png")
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.correctOrWrong.image = UIImage(named:"")
        }
        
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
        
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //セグエを準備(prepare)するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswers = self.correctAnswers
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
