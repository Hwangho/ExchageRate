//
//  TranslateViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON

// UIResponderChain > resignFirstResponder() / becomeFirstResponder()


class TranslateViewController: UIViewController {
    
    static let identifier = "TranslateViewController"

    
    @IBOutlet weak var userInputTextView: UITextView!
    @IBOutlet weak var translatedOutputTextView: UITextView!
    

    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해보세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInputTextView.delegate = self
        setPlaceholder()
        requestTranslatedData()
    }
    
    func setPlaceholder() {
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
    }
    
    func requestTranslatedData() {
        let url = EndPoint.translateURL
        let parameter = ["source":"ko",
                         "target": "en",
                         "text" : "안녕하세요. 저는 고래밥을 좋아합니다."]
        let header: HTTPHeaders = ["X-Naver-Client-Id" : APIKey.NAVER_ID,
                      "X-Naver-Client-Secret" :APIKey.NAVER_SECRET]
        
        AF.request(url, method: .post, parameters: parameter, headers: header).validate(statusCode: 200..<400).responseJSON {[weak self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let statusCode = response.response?.statusCode ?? 500
                
                if statusCode == 200 {
                    self?.translatedOutputTextView.text = json["message"]["result"]["translatedText"].stringValue
                } else {
                    self?.userInputTextView.text = json["errorMEssage"].stringValue
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}



extension TranslateViewController: UITextViewDelegate {
    
    // 텍스트뷰의 텍스트가 변할 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
    }
    // 편집이 시작될 떄, 커서가 시작될 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    // 편집이 끝났을 떄, 커서가 없어지는 순간
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            setPlaceholder()
        }
    }
}
