//
//  RankingViewController.swift
//  QuizApp
//
//  Created by KudoRintaro on 2018/09/21.
//  Copyright © 2018年 Rintaro Kudo. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource {
    
    //storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //点数を格納する配列
    var scoreArray: Array<Int> = []

    //正解数
    var correctAnswers: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //テーブルビューのデータソースメソッドはResultViewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //scoreArray.append = [correctAnswers]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
//セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreArray.count
    }
    
//ID付きのセルを取得して、セル付属のTextLabelに文字を表示する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = String(scoreArray[indexPath.row])
        
        return cell!
    }
    
    @IBAction func backToScore(){
        self.dismiss(animated: true, completion: nil) 
    }
    
    
}
