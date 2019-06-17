//
//  DateHeaderView.swift
//  CCDatePicker
//
//  Created by panjiulong on 2019/1/16.
//  Copyright © 2019 XiaoSao6. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width

protocol ChooseViewProtocol {
    var headerView:DateHeaderView?{get set}
    var chooseView:UIView?{get set}
}

extension ChooseViewProtocol{
    var headerView:DateHeaderView?{
        let headerView = DateHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 42))
        return headerView
    }
}

protocol DateHeaderViewDelegate:class {
    func dateHeaderView(_ dateHeaderView:DateHeaderView,didTapCancel button:UIButton)
    func dateHeaderView(_ dateHeaderView:DateHeaderView,didTapConfirm button:UIButton)
}

class DateHeaderView: UIView {
    
    let buttonW:CGFloat = 70
    
    var config = DatePickerConfig(){
        didSet{
            cancleBtn.setAttributedTitle(config.cancleTitle, for: .normal)
            confirmBtn.setAttributedTitle(config.confirmTitle, for: .normal)
            titleLabel.attributedText = config.title
            lineView.backgroundColor = config.headerLineColor
        }
    }
    
    weak var delegate:DateHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        addSubview(cancleBtn)
        addSubview(confirmBtn)
        addSubview(lineView)
        addSubview(titleLabel)
        backgroundColor = config.headerBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cancleBtn.frame = CGRect(x: 0, y: 0, width: buttonW, height: self.bounds.height)
        confirmBtn.frame = CGRect(x: kScreenWidth - buttonW, y: 0, width: buttonW, height:  self.bounds.height)
        titleLabel.frame = CGRect(x: cancleBtn.bounds.width, y: 0, width: kScreenWidth - cancleBtn.bounds.width - confirmBtn.bounds.width, height: self.bounds.height)
        lineView.frame = CGRect(x: 0, y: self.bounds.height - 1, width: kScreenWidth, height: 1)
    }
    
    lazy var cancleBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setAttributedTitle(config.cancleTitle, for: .normal)
        btn.addTarget(self, action: #selector(cancelButtonClicked(btn:)), for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: buttonW, height: self.bounds.height)
        return btn
    }()
    
    lazy var confirmBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setAttributedTitle(config.confirmTitle, for: .normal)
        btn.addTarget(self, action: #selector(confirmButtonClicked(btn:)), for: .touchUpInside)
        btn.frame = CGRect(x: kScreenWidth - buttonW, y: 0, width: buttonW, height:  self.bounds.height)
        return btn
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: cancleBtn.bounds.width, y: 0, width: kScreenWidth - cancleBtn.bounds.width - confirmBtn.bounds.width, height: self.bounds.height))
        titleLabel.attributedText = config.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var lineView:UIView = {
        let line = UIView(frame: CGRect(x: 0, y: self.bounds.height - 1, width: kScreenWidth, height: 0.5))
        line.backgroundColor =  config.headerLineColor
        return line
    }()

}

extension DateHeaderView{
    @objc func cancelButtonClicked(btn:UIButton) {
        delegate?.dateHeaderView(self, didTapCancel: btn)
    }
    @objc func confirmButtonClicked(btn:UIButton) {
        delegate?.dateHeaderView(self, didTapConfirm: btn)
    }
}
