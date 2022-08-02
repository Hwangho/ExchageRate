//
//  TextFieldMoveViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/31.
//

import UIKit

class TextFieldMoveViewController: UIViewController {
    
    @IBOutlet weak var sampleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeKeyBoardNotification()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.sampleTextField.resignFirstResponder()
        
    }
    
    
    func makeKeyBoardNotification() {

        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ketVoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyBoardWillShow(_ notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
                
//        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        
        self.view.frame.origin.y = 0 - keyboardSize.height
    }
    

    @objc
    func ketVoardWillHide(_ notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}

