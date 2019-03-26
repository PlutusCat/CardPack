//
//  AddCardTableViewCell.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/25.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

class AddCardTableViewCell: BaseTableViewCell {

    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "实体卡号："
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var textField: UITextField = {
       let text = UITextField()
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.tintColor = .pureBlack
        text.clearButtonMode = .whileEditing
        text.keyboardType = .numberPad
        text.delegate = self
        return text
    }()
    
    private lazy var bottomBorder: UIView = {
        let border = UIView()
        border.backgroundColor = UIColor.pureBlack.withAlphaComponent(0.7)
        return border
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textField.becomeFirstResponder()
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        contentView.addSubview(bottomBorder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        textField.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        bottomBorder.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(0.5)
            make.top.equalTo(textField.snp.bottom).offset(6)
        }
    }
    
}

extension AddCardTableViewCell {
    open class var id: String { return "AddCardTableViewCell_ID" }
    open class var cellHeight: CGFloat { return 100 }
}

extension AddCardTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
}
