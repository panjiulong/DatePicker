//
//  ViewController.swift
//  DatePicker
//
//  Created by Zachry on 06/12/2019.
//  Copyright (c) 2019 Zachry. All rights reserved.
//

import UIKit
import DatePicker

class ViewController: UIViewController {

    @IBAction func openClicked(_ sender: UIButton) {
        var config = DatePickerConfig()
        config.minDate =  Date().addingTimeInterval(( 365 * 1 * 24 * 60 * 60) * -100)
        config.defualtSelectedDate = Date.create(from: sender.titleLabel?.text ?? "") ?? Date()
        config.pickerBackgroundColor = .green
        config.cancleTitle = NSAttributedString(string: "cancel", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)])
        config.confirmTitle = NSAttributedString(string: "confirm", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)])
        config.title = NSAttributedString(string: "没得打双打的大时代", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)])
        config.headerLineColor = .gray
        config.backgroundColor = UIColor(red: 0.5, green: 0.1, blue: 0.1, alpha: 0.1)
        config.headerHeight = 60.0
        config.pickerHeight = 250.0
        config.pickerBackgroundColor = .white
        config.pickerTextFont = UIFont.systemFont(ofSize: 30)
        config.pickerTextColor = UIColor.yellow
        config.pickerRowHeight = 60
        config.pickerSeparatorColor = .white
        
        config.cancelClosure = {btn in
            print("cancle")
        }
        config.confirmClosure = {date in
            guard let date = date else {return}
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let text = formatter.string(from: date)
            sender.setTitle(text, for: .normal)
        }
       let aa = DatePicker(config: config)
        aa.show()
        
    }
}

extension Date{
    static func create(from dateString:String,dateFormat:String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else{
            return nil
        }
        return date
    }
}
