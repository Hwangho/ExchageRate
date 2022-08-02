//
//  SecondViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/31.
//

import UIKit

class SecondViewController: UIViewController {

    let identifier = "SecondViewController"
    
    @IBOutlet weak var sampleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.sampleTextField.resignFirstResponder()
    }

    @IBAction func tapDismissButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("secondeViewText"), object: nil, userInfo: ["textFIeld" : sampleTextField.text])

        self.dismiss(animated: true)
    }
    
}




// 알림을 식별하는 태그
//        var name: Notification.Name
// 발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하는 데 쓰임
//        var object: Any?
// Notification과 관련된 값 또는 객체의 저장소
//        var userInfo: [AnyHashable : Any]?

// NotificationCenter.default.post(name: NSNotification.Name("text"), object: nil, userInfo: ["내용" : sampleTextField.text as Any] )
