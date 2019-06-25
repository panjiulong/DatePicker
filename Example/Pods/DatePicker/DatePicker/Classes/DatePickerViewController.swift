//
//  DateKeyboardViewController.swift
//  JLDatePicker
//
//  Created by panjiulong on 2019/1/17.
//  Copyright © 2019 XiaoSao6. All rights reserved.
//

import UIKit
//import SnapKit

class DatePickerViewController: UIViewController{
    
    var selectedDate:Date?
    
    var headerView:UIView?
    
    var config:DatePickerConfig
    
    init(_ config:DatePickerConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = config.headerView ?? dateHeaderView
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datePickerView.setDate(config.defualtSelectedDate)
    }
    
    func setupUI() {
        if let headerView = headerView{
            view.addSubview(headerView)
            headerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - config.pickerHeight - config.headerHeight , width: UIScreen.main.bounds.width, height: config.headerHeight)
        }
        view.addSubview(datePickerView)
        datePickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - config.pickerHeight , width: UIScreen.main.bounds.width, height: config.pickerHeight)
    }
    
    lazy var dateHeaderView:DateHeaderView = {
        let header = DateHeaderView()
        header.config = config
        header.delegate = self
        return header
    }()
    
    lazy var datePickerView: DatePickerView = {
        let datepicker = DatePickerView.init(minDate: config.minDate, maxDate: config.maxDate)!
        datepicker.delegate = self
        datepicker.backgroundColor = config.pickerBackgroundColor
        datepicker.titleFont = config.pickerTextFont
        datepicker.titleColor = config.pickerTextColor
        datepicker.rowHeight =  config.pickerRowHeight
        datepicker.yearAttributedString = config.yearAttributedString
        datepicker.monthAttributedString = config.monthAttributedString
        datepicker.dayAttributedString = config.dayAttributedString
        datepicker.separatorColor = config.pickerSeparatorColor
        datepicker.setDate(config.defualtSelectedDate)
        return datepicker
    }()
}

//MARK - DateHeaderViewDelegate
extension DatePickerViewController:DateHeaderViewDelegate{
    func dateHeaderView(_ dateHeaderView: DateHeaderView, didTapCancel button: UIButton) {
        self.dismiss(animated: true, completion: nil)
        config.cancelClosure?(button)
    }
    
    func dateHeaderView(_ dateHeaderView: DateHeaderView, didTapConfirm button: UIButton) {
        self.dismiss(animated: true, completion: nil)
        config.confirmClosure?(selectedDate)
    }
}

//MARK - DatePickerViewDelegate
extension DatePickerViewController:DatePickerViewDelegate{
    func didSelectDate(at picker: DatePickerView) {
        selectedDate = picker.currentDate
    }
}
