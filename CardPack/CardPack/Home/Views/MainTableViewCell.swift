//
//  MainTableViewCell.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/20.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

class MainTableViewCell: BaseTableViewCell {

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.colors = [UIColor(hex: "#ff5845").cgColor, UIColor(hex: "#ff5810").cgColor]
        gradient.locations = [0.3, 1]
        return gradient
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var bankIcon: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var bankName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "招商银行"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var cardType: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "储值卡"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var cardNum: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "**** **** **** ****"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    private lazy var unionPayIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ChinaUnionPay_icon")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var visaIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Visa_icon")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let insets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right:16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(backView)
        backView.layer.addSublayer(gradientLayer)
        
        backView.addSubview(bankIcon)
        backView.addSubview(bankName)
        backView.addSubview(cardType)
        backView.addSubview(cardNum)
        backView.addSubview(unionPayIcon)
        backView.addSubview(visaIcon)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload(with model: CardPositiveModel) {
        cardNum.text = model.cardNum.formatGroup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(insets)
        }
        bankIcon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 36, height: 36))
            make.left.equalToSuperview().offset(26)
            make.top.equalToSuperview().offset(16)
        }
        bankName.snp.makeConstraints { (make) in
            make.left.equalTo(bankIcon.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(bankIcon)
        }
        cardType.snp.makeConstraints { (make) in
            make.left.right.equalTo(bankName)
            make.top.equalTo(bankName.snp.bottom)
        }
        cardNum.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.center.equalToSuperview()
        }
        unionPayIcon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 32))
            make.right.bottom.equalToSuperview().inset(16)
        }
        visaIcon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 32))
            make.right.equalTo(unionPayIcon.snp.left).inset(-16)
            make.bottom.equalTo(unionPayIcon)
        }
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = backView.bounds
        backView.clipRectCorner(direction: .allCorners, cornerRadius: 10)
        bankIcon.clipRectCorner(direction: .allCorners, cornerRadius: bankIcon.width*0.5)
    }
    
}

extension MainTableViewCell {
    open class var id: String { return "MainTableViewCell_ID" }
    
    open class var cellHeight: CGFloat { return 170 }
}
