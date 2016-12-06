//
//  ViewController.swift
//  calcrator2
//
//  Created by shogoyamada  on 2016/09/19.
//  Copyright © 2016年 shogoyamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //途中計算や結果が出力されるラベル
    @IBOutlet weak var calcLabel: UILabel!
    
    //演算子ボタン各種アウトレット接続
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var divitionButton: UIButton!
    @IBOutlet weak var multiButton: UIButton!
    
    //演算子を格納するラベル(右)
    @IBOutlet weak var operatprLabel: UILabel!
    
    //最初に入力された数値が入るラベル(左)
    @IBOutlet weak var value1Label: UILabel!
    
    //まず最初にここが呼ばれます
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcLabel.text = ""
        operatprLabel.text = ""
        value1Label.text = ""
        
        //演算子ボタンを非活性にする
        chengeButtonEnabled(enabled: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //数値がクリックされた時に呼ばれる
    @IBAction func pushNumber(_ sender: AnyObject) {
        
        //テキストにデータを追加
        calcLabel.text! += (sender.titleLabel!?.text!)!
        
        //演算子ボタンを活性にする
        chengeButtonEnabled(enabled: true)
    }
    
    //演算子を押した時の呼ばれる
    @IBAction func pushOperator(_ sender: AnyObject) {
        
        operatprLabel.text = (sender.titleLabel!?.text!)!
        value1Label.text = calcLabel.text
        calcLabel.text = ""
        
        //演算子ボタンを活性にする
        chengeButtonEnabled(enabled: false)
        
    }
    
    //Cを押した時に呼ばれる
    @IBAction func pushClear(_ sender: AnyObject) {
        
        value1Label.text = ""
        calcLabel.text = ""
        operatprLabel.text = ""
    }
    
    //イコールが押された時の処理
    @IBAction func pushEquals(_ sender: AnyObject) {
        
        if operatprLabel.text == "+" {
            calcLabel.text = String(Int(value1Label.text!)! + Int(calcLabel.text!)!)
        }else if operatprLabel.text == "-" {
            calcLabel.text = String(Int(value1Label.text!)! - Int(calcLabel.text!)!)
        }else if operatprLabel.text == "*" {
            calcLabel.text = String(Int(value1Label.text!)! * Int(calcLabel.text!)!)
        }else{
            calcLabel.text = String(Int(value1Label.text!)! / Int(calcLabel.text!)!)
        }
        
        value1Label.text = ""
        operatprLabel.text = ""
        
    }
    
    //ボタンの状態を変化させるメソッド
    //param false:非活性　true : 活性
    func chengeButtonEnabled(enabled : Bool){
        
        plusButton.isEnabled = enabled
        minusButton.isEnabled = enabled
        divitionButton.isEnabled = enabled
        multiButton.isEnabled = enabled
    }
    
}

