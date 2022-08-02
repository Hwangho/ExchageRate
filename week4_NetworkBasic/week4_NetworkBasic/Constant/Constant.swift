//
//  Constant.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/08/01.
//

import Foundation


struct APIKey {
    static let BOXOFFICE = "4b67093523cd3914cc5bb7ff03276855"
    
    static let NAVER_ID = "f1nzQi4h4Rqh9VizCfuH"
    
    static let NAVER_SECRET = "Z_msnOSRHX"
}


struct EndPoint {
    static let boxOfficeURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    
    static let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber"
    
    static let translateURL = "https://openapi.naver.com/v1/papago/n2mt"
}

enum StoryboardName: String {
    case main = "Main"
    case search = "Search"
    case setting = "Setting"
}


struct StoryBoardName {
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
}


