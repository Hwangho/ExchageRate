//
//  CheckViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/28.
//

import UIKit

class CheckViewController: UIViewController, ViewPresentableProtocol {
    
    var navigationTitleString: String {
        get {
            return "대왕님의 다마고치"
        }
        set {
            title = newValue
        }
    }
    
    var backgroundColor: UIColor {
        get {
            return .blue
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationTitleString = "고래밥 님의 다마고치"
       
    }
    
    
    func configureView() {
        title = navigationTitleString
        view.backgroundColor = backgroundColor
    }


}
