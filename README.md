# 倒计时按钮(SFCountDownButton)
## 示例
![示例](https://github.com/AbnormalProgrammer/SFCountdownButton/raw/master/resources/示例.gif)
## 它是什么？
它是用来做倒计时的UI控件。
## 需求背景
它可以应用在防止快速重复操作的地方。比如，发完短信以后60秒内不让用户再次请求发送短信。
## 行为表现
用户在可点击状态下点击该UI控件，该控件即进入倒数状态，在倒数状态下，它不响应任何事件，直到倒数完毕。
## 默认设定
可以在`SFCountDownButtonSettingModel`中查看该控件的默认设定。
当前默认设定如下所示：
```
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
```
## 如何使用？
1. 创建该控件对象。
```
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
```
2. 在使用的地方布局。
```
self.view.translatesAutoresizingMaskIntoConstraints = false
self.view.addSubview(self.resendButton)
NSLayoutConstraint.init(item: self.resendButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
NSLayoutConstraint.init(item: self.resendButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
```
3. 遵守`SFCountDownButtonProtocol`协议
```
func SFCountDownButtonCallback(_ sender: SFCountDownButton) {
    print("点击了按钮")
}
```
4. 整体效果可以参考`ViewController.swift`
## 适用平台
iOS 14及以后的版本。
## 开发语言
Swift 5.0。
## 编译器
XCode 12.5。
## 作者联系方式
参见作者介绍。
## 许可
本控件遵循MIT许可，详情请见[LICENSE](https://github.com/AbnormalProgrammer/SFCountdownButton/raw/master/LICENSE)。
