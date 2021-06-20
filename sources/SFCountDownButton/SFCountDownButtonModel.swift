//
//  LPReciprocalModel.swift
//  LovelyPet
//
//  Created by Stroman on 2021/6/18.
//

import UIKit

class SFCountDownButtonModel: NSObject {
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
    @objc dynamic internal var liveSeconds:Int = 0/*当前的实时秒数*/
    // MARK: - delegates
}
