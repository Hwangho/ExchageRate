//
//  ViewPresentableProtocol.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/28.
//

import Foundation
import UIKit

// 프로토콜은 규약이자 필요한 요소를 명세만 할 뿐, 실질적인 구현부는 작성하지 않는다!
// 실질적인 구현은 프로토콜을 채택, 준수한 타입이 구현한다!
// 클래스, 구조체, 익스텐션, 열거형 ...
// 클래스는 단일 상속만 가능하지만, 프로토콜은 채택 갯수에 제한이 없습니다.
// @objc optional > 선택적 요청(Optional Require)
// 프로토콜 프로퍼티, 프로토콜 메서드

// 프로토콜 프로퍼티: 연산 프로퍼티로 쓰든 저장 프로퍼티로 쓰든 상관하지 않는다!
// 명세하지 않기에, 구현을 할 때 프로퍼티를 저장 프로퍼티로 쓸 수도 있고 연산 프로퍼티로 사용할 수도 있다.
// 무조건 var(변수)로 선언해야 된다.
// 만약 {get}을 명시했다면, get 기능만 최소한 구현되어 있으면 된다! -> So 필요하다면 set 구현해도 괜찮음.

@objc
protocol ViewPresentableProtocol {
    
    // 프로퍼티
    var navigationTitleString: String { get set } // 읽기, 쓰기
    var backgroundColor: UIColor { get }  // 읽기
    
    
    // 메서드
    func configureView()
    @objc optional func configureLable()
    @objc optional func configureTextfield()
}



protocol HwanghoTableViewProtocol {
    func numberOfRowsInSection() -> Int
    
    func cellForRowAt(indexPAth: IndexPath) -> UITableViewCell
}
