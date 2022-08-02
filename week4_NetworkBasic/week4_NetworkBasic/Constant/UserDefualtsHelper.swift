//
//  UserDefualtsHelper.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/08/01.
//

import Foundation


class USerDefaultsHelper {
    
    private init() {
        
    }
    
    static let standard = USerDefaultsHelper()
    
    let userDefaults = UserDefaults.standard

    enum key: String {
        case nikname,age
    }
    
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: key.nikname.rawValue) ?? ""
        }
        set { // 연산 프로퍼티 parameter
            userDefaults.set(newValue, forKey: key.nikname.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: key.age.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: key.age.rawValue)
        }
    }
}
