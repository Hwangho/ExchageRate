//
//  ScrollTextFieldViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/31.
//

import UIKit

class ScrollTextFieldViewController: UIViewController {
    
    
    @IBOutlet weak var sampleTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // to store the current active textfield
    var activeTextField : UITextField? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureRecognizer()
        
        sampleTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    
    private func setupGestureRecognizer() {
      let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
      view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
      view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
         else {
           // if keyboard size is not available for some reason, dont do anything
           return
         }

         let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
         scrollView.contentInset = contentInsets
         scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
//        // move back the root view origin to zero
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        // reset back the content inset to zero after keyboard is gone
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
}


extension ScrollTextFieldViewController : UITextFieldDelegate {
  // when user select a textfield, this method will be called
    
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // set the activeTextField to the selected textfield
    self.activeTextField = textField
  }
    
  // when user click 'done' or dismiss the keyboard
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}


