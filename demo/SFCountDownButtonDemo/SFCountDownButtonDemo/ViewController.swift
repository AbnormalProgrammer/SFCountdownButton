//
//  ViewController.swift
//  SFCountDownButtonDemo
//
//  Created by Stroman on 2021/6/20.
//

import UIKit

class ViewController: UIViewController,SFCountDownButtonProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.resendButton)
        NSLayoutConstraint.init(item: self.resendButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.resendButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        // Do any additional setup after loading the view.
    }
    
    func SFCountDownButtonCallback(_ sender: SFCountDownButton) {
        print("点击了按钮")
    }
    
    lazy private var resendButton:SFCountDownButton = {
        let result:SFCountDownButton = SFCountDownButton.init { make in
            make.buttonCornerRadius = 22
            make.countdownDuring = 5
            make.buttonWidth = 259
            make.buttonHeight = 44
            make.countdownTitleColor = .white
            make.countdownPreTitle = "还剩("
            make.countdownLastTitle = ")"
            make.normalTitle = "重新倒计时"
            make.normalTitleColor = .white
        }
        result.delegate = self
        return result
    }()
}

