//
//  LPReciprocalButton.swift
//  LovelyPet
//
//  Created by Stroman on 2021/6/18.
//

import UIKit

protocol SFCountDownButtonProtocol:NSObjectProtocol {
    func SFCountDownButtonCallback(_ sender:SFCountDownButton) -> Void
}

class SFCountDownButton: UIButton {
    // MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        self.viewModel.removeObserver(self, forKeyPath: "liveSeconds")
        print("\(type(of: self))释放了")
    }
    
    convenience init(_ make:@escaping((SFCountDownButtonSettingModel) -> Void)) {
        self.init()
        make(self.settingModel)
        self.customInitilizer()
        self.installUI()
    }
    
    
    // MARK: - custom methods
    private func customInitilizer() -> Void {
        self.viewModel.addObserver(self, forKeyPath: "liveSeconds", options: .new, context: nil)
        self.layer.cornerRadius = self.settingModel.buttonCornerRadius
        self.layer.masksToBounds = true
        self.adjustsImageWhenHighlighted = false
        self.addTarget(self, action: #selector(clickAction), for: UIControl.Event.init(rawValue: UIControl.Event.touchUpInside.rawValue | UIControl.Event.touchUpOutside.rawValue))
    }
    
    private func installUI() -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: self.settingModel.buttonWidth).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: self.settingModel.buttonHeight).isActive = true
        self.freshNormalUI()
    }
    
    /*
     连接倒计时的标题
     */
    private func connectReciprocalTitle() -> String {
        var result:String = ""
        result.append(self.settingModel.countdownPreTitle)
        result.append(String.init(self.viewModel.liveSeconds))
        result.append(self.settingModel.countdownLastTitle)
        return result
    }
    
    /*
     刷新倒数时候的UI
     */
    private func freshReciprocalUI() -> Void {
        DispatchQueue.main.async {
            self.backgroundColor = self.settingModel.countdownStatusColor
            self.setTitle(self.connectReciprocalTitle(), for: .normal)
            self.titleLabel?.font = self.settingModel.countdownTitleFont
            self.setTitleColor(self.settingModel.countdownTitleColor, for: .normal)
        }
    }
    
    /*
     刷新正常状态下的UI
     */
    private func freshNormalUI() -> Void {
        DispatchQueue.main.async {
            self.backgroundColor = self.settingModel.normalStatusColor
            self.setTitle(self.settingModel.normalTitle, for: .normal)
            self.titleLabel?.font = self.settingModel.normalTitleFont
            self.setTitleColor(self.settingModel.normalTitleColor, for: .normal)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as? SFCountDownButtonModel) === self.viewModel {
            if self.viewModel.liveSeconds != 0 {
                self.freshReciprocalUI()
            } else {
                self.freshNormalUI()
                if self.timer?.isCancelled == false {
                    self.timer?.cancel()
                }
            }
        }
    }
    
    private func createTimer() -> DispatchSourceTimer {
        let result:DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        result.schedule(deadline: .now(), repeating: .seconds(1), leeway: .seconds(0))
        weak var weakself = self
        result.setEventHandler {
            weakself?.reciprocalAction()
        }
        return result
    }
    // MARK: - public interfaces
    /*
     开始倒计时
     */
    internal func start() -> Void {
        self.viewModel.liveSeconds = self.settingModel.countdownDuring
        self.backgroundColor = self.settingModel.countdownStatusColor
        self.setTitle(self.connectReciprocalTitle(), for: .normal)
        if self.timer?.isCancelled == false {
            self.timer?.cancel()
        }
        self.timer = nil
        self.timer = self.createTimer()
        self.timer?.resume()
    }
    // MARK: - actions
    /*
     只有在倒数完毕的情况下才是可点击的。
     */
    @objc private func clickAction() -> Void {
        guard self.viewModel.liveSeconds == 0 else {
            return
        }
        self.start()
        self.delegate?.SFCountDownButtonCallback(self)
    }
    
    /*倒计时事件*/
    private func reciprocalAction() -> Void {
        self.viewModel.liveSeconds = self.viewModel.liveSeconds - 1
        self.viewModel.liveSeconds = max(0, self.viewModel.liveSeconds)
    }
    // MARK: - accessors
    private let viewModel:SFCountDownButtonModel = SFCountDownButtonModel.init()
    private let settingModel:SFCountDownButtonSettingModel = SFCountDownButtonSettingModel.init()
    weak internal var delegate:SFCountDownButtonProtocol?
    private var timer:DispatchSourceTimer?
    // MARK: - delegates
}
