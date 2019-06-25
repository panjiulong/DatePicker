//
//  DatePicker.swift
//  DatePicker_Example
//
//  Created by PanJiuLong on 2019/6/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public typealias DatePickerCallback = ( Date? ) -> Void

public struct DatePickerConfig {
    public init(){}
    //最小时间
    public var minDate:Date = Date()
    //最大时间
    public var maxDate:Date = Date()
    //选择的时间
    public var defualtSelectedDate:Date = Date()
    //整体的背景颜色
    public var backgroundColor:UIColor = UIColor.gray
    //点击确定的回调
    public var confirmClosure:((Date?)->())?
    //点击取消的回调
    public var cancelClosure:((UIButton)->())?
    //headerView相关
    public var headerView:UIView?
    public var headerHeight:CGFloat = 44.0
    public var headerBackgroundColor:UIColor = .white
    public var cancleTitle:NSAttributedString = NSAttributedString(string: "取消", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
    public var confirmTitle:NSAttributedString = NSAttributedString(string: "确定", attributes:
        [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
    public var title:NSAttributedString = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
    public var headerLineColor:UIColor = UIColor.lightGray
    //picker相关
    public var pickerHeight:CGFloat = 250.0
    public var pickerBackgroundColor:UIColor = .white
    public var pickerTextFont:UIFont = UIFont.systemFont(ofSize: 20)
    public var pickerTextColor:UIColor = UIColor.black
    public var pickerRowHeight:CGFloat = 45.0
    public var pickerSeparatorColor:UIColor = UIColor.white
    
    public var yearAttributedString:((String)->NSAttributedString)? = {
        yearText in
        return  NSAttributedString(string: "\(yearText)年", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)])
    }
    public var monthAttributedString:((String)->NSAttributedString)? = {
        yearText in
        return  NSAttributedString(string: "\(yearText)月", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)])
    }
    public var dayAttributedString:((String)->NSAttributedString)? = {
        yearText in
        return  NSAttributedString(string: "\(yearText)日", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)])
    }
    
}

open class DatePicker: NSObject {
    public var config : DatePickerConfig = DatePickerConfig()
    
    public init(config:DatePickerConfig) {
        super.init()
        self.config = config
    }
    
    public func show() {
        let datePickerVC = DatePickerViewController(config)
        let animation = PopoverAnimator(transitionDuration: 0.5, backColor: UIColor(white: 0.3, alpha: 0.3))
        datePickerVC.modalPresentationStyle = .custom
        datePickerVC.transitioningDelegate = animation
        UIApplication.shared.keyWindow?.rootViewController?.present(datePickerVC, animated: true, completion: nil)
    }
    
}
