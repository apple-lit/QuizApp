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

    //UserDefaultsにアクセス
    var saveData : UserDefaults = UserDefaults.standard
    
    //点数を格納する配列
    var scoreArray: Array<Int> = []
    
    //結果を表示数ラベル
    @IBOutlet var resultLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(correctAnswers)
       
        //userDefaultsからデータを取得
        
        if saveData.object(forKey: "scoreKey") != nil{
        scoreArray = saveData.object(forKey: "scoreKey") as! Array<Int>
        }
        
    //scoreArrayに点数を格納
        scoreArray.append(correctAnswers)
        
       //scoreArrayに格納されている点数を降順に並び替える
        scoreArray.sort(by:{
            $0 > $1
        })
        
        //userDefaultsにscoreを保存
        saveData.set(scoreArray, forKey:"scoreKey")
        
        
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
    
    
    //ランキングボタン
   
    @IBAction func toRanking(){
        
        
        
        performSegue(withIdentifier: "toRankingView", sender: nil)
        
    }
        func performSegueToRanking(){
            
        }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toRankingView"{
            let rankingViewController = segue.destination as! RankingViewController
            rankingViewController.scoreArray = self.scoreArray
            //rankingViewController.correctAnswers = self.correctAnswers
            }
        }
 
    
    
    
    
 

}
