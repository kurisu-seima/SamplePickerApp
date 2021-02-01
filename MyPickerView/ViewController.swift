//
//  ViewController.swift
//  MyPickerView
//
//  Created by くりすせいま on 2020/10/05.
//  Copyright © 2020 せいま. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //ラベルのプロパティ宣言
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var myLabel3: UILabel!
    
    //ピッカービューのプロパティ宣言
    @IBOutlet weak var myPickerView: UIPickerView!
    
    //コンポーネントに表示する項目名
    let compos = [["あ", "い", "う", "え", "お"], ["さ", "し", "す", "せ", "そ"], ["た", "ち", "つ"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myPickerViewのデリゲートになる
        myPickerView.delegate = self
        //myPickerViewのデータソースになる
        myPickerView.dataSource = self
    }

    //コンポーネントの個数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    //各コンポーネントの行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    //各コンポーネントの横幅を返す
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0, 1, 2:
            return 100
        default:
            return 100
        }
    }
   
    //コンポーネントに表示させる各行の項目を設定する
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //指定のコンポーネントから行の項目名を取り出す
        let item = compos[component][row]
        return item
    }
    
    //コンポーネントの項目が選択された時の処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        //コンポーネントの行番号を取得
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        let row3 = pickerView.selectedRow(inComponent: 2)
        
        //選択された行の項目名をラベルに表示させる
          //コンポーネントの行番号をもとに項目名を取得している
        switch row {
        case row1:
            let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
            myLabel1.text = item1
        case row2:
            let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
            myLabel2.text = item2
        case row3:
            let item3 = self.pickerView(pickerView, titleForRow: row3, forComponent: 2)
            myLabel3.text = item3
        default:
            return
        }
    }
}

