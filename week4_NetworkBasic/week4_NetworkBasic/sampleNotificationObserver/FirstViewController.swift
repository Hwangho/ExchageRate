//
//  FirstViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/31.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var sampleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(changeLable(_:)), name: NSNotification.Name("secondeViewText"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("secondeViewText"), object: nil)
    }

    
    @objc func changeLable( _ notification: NSNotification) {
        guard let userinfo = notification.userInfo else { return }
        
        sampleLabel.text = userinfo["textFIeld"] as! String
    }

    
    @IBAction func tapNextView(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
}







// NotificationCenter.default.removeObserver(self, name: NSNotification.Name("text"), object: nil)

// NotificationCenter.default.addObserver(self, selector: #selector(changeData(_ :)), name: NSNotification.Name("text"), object: nil)

//@objc func changeData(_ notification: NSNotification) {
//     guard let userinfo = notification.userInfo else { return }
//     self.sampleLabel.text = userinfo["내용"] as! String
//}

