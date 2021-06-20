//
//  LPReciprocalViewModel.swift
//  LovelyPet
//
//  Created by Stroman on 2021/6/18.
//

import UIKit

class SFCountDownButtonSettingModel: NSObject {
    // MARK: - lifecycle
    deinit {
        print("\(type(of: self))释放了")
    }
    
    override init() {
        super.init()
        self.customInitilizer()
    }
    // MARK: - custom methods
    private func customInitilizer() -> Void {
    }
    // MARK: - public interfaces
    // MARK: - actions
    // MARK: - accessors
    internal var buttonWidth:CGFloat = 259/*按钮的宽度*/
    internal var buttonHeight:CGFloat = 44/*按钮的高度*/
    internal var buttonCornerRadius:CGFloat = 22/*按钮的圆角半径*/
    internal var normalStatusColor:UIColor = UIColor.systemRed/*正常状态下的背景颜色*/
    internal var countdownStatusColor:UIColor = UIColor.systemGray/*倒数状态下的背景颜色*/
    internal var countdownDuring:Int = 60/*倒数描述，默认为60秒*/
    internal var countdownPreTitle:String = ""/*倒数状态下前半部分标题*/
    internal var countdownLastTitle:String = ""/*倒数状态下后半部分标题*/
    internal var normalTitle:String = ""/*正常状态下的标题*/
    internal var countdownTitleFont:UIFont = UIFont.systemFont(ofSize: 16)/*倒数状态下的标题字体*/
    internal var countdownTitleColor:UIColor = .white/*倒数状态下的标题颜色*/
    internal var normalTitleFont:UIFont = UIFont.systemFont(ofSize: 16)/*正常状态的标题字体*/
    internal var normalTitleColor:UIColor = .white/*正常状态下的标题颜色*/
    internal var selfObserver:Any?/*观察者*/
    // MARK: - delegates
}
