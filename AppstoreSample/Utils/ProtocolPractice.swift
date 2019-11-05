//
//  ProtocolPractice.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/30.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

//protocol CustomViewDelegate: class {
//  func viewFrameChanged(newFrame: CGRect)
//}
//
//class CustomView: UIView {
//  weak var delegate: CustomViewDelegate? //프로토콜 타입
//
//  override func layoutSubviews() {
//    delegate?.viewFrameChanged(newFrame: frame)
//  }
//}
//
//class ViewController: UIViewController, CustomViewDelegate {
//	func viewFrameChanged(newFrame: CGRect) {
//		<#code#>
//	}
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    let customView = CustomView()
//    customView.delegate = self
//    view.addSubview(customView)
//  }
//
//}
//
//protocol 데이터_내놔 { //1. delegate 선언
//  func 데이터_다_만들었어()
//}
//
//class AClass: 데이터_내놔 {
//	func 데이터_다_만들었어() {
//		<#code#>
//	}
//	
//  func call() {
//    BClass().delegate = self
//    BClass().createData()
//    // B가 만든 데이터 받아야되는데?
//  }
//}
//
//class BClass {
//  var delegate: 데이터_내놔?
//  func createData() {
//    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//      //10초 후에 데이터 만들기 작업 종료!
//      self.delegate?.데이터_다_만들었어()
//    }
//  }
//}

//protocol DataDelegate {
//	func awef()
//}
//
//class AClass: DataDelegate {
//	func awef() {
//		<#code#>
//	}
//
//
//}
//
//class BClass {
//	var delegate: DataDelegate?
//
//}
