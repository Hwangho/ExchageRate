//
//  LottoViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON


class LottoViewController: UIViewController{

    static let identifier = "LottoViewController"
    
    
    @IBOutlet weak var numberTextField: customTextField!
    
    @IBOutlet var numberLabel: [UILabel]!
    
    @IBOutlet weak var bonusNumberLabel: UILabel!
    
    var lottoPickerView = UIPickerView()
    
    
    
    let lottoList: [Int] = Array(1...1025).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        numberTextField.delegate = self
        setDesign()
        becomeFirstResponder()
        requestLotto(number: 986)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.numberTextField.resignFirstResponder()
    }
    
    
    func setDesign() {
        for label in numberLabel {
            label.clipsToBounds = true
            label.layer.cornerRadius = 8
            label.backgroundColor = .green
        }
        bonusNumberLabel.clipsToBounds = true
        bonusNumberLabel.layer.cornerRadius = 8
        bonusNumberLabel.backgroundColor = .orange
    }
    
    
    func requestLotto(number: Int) {
        let url = "\(EndPoint.lottoURL)&drwNo=\(number)"
        
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON {[weak self] response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                
                for row in 1...(self?.numberLabel.count)! {
                    self?.numberLabel[row-1].tag = row
                    self?.numberLabel[row-1].text = " \(json["drwtNo\(row)"].intValue) "
                }
                self?.numberTextField.text = "\(number)회차"
                
                let bonus = json["bnusNo"].intValue
                self?.bonusNumberLabel.text = " \(bonus) "
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}



extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lottoList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestLotto(number: lottoList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(lottoList[row])회차"
    }
    
}


extension LottoViewController: UITextFieldDelegate {

    


//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        textField.isUserInteractionEnabled = false
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.isUserInteractionEnabled = true
//    }
    

}

class customTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }

        return super.canPerformAction(action, withSender: sender)
    }
}
