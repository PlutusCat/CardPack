//
//  AddCardTableView.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/25.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

class AddCardTableView: BaseTableView {

    private lazy var header: AddCardHeader = {
        let headerView = AddCardHeader(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: frame.width,
                                                     height: 100))
        return headerView
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        delegate = self
        dataSource = self
        register(AddCardTableViewCell.self, forCellReuseIdentifier: AddCardTableViewCell.id)
        
        tableHeaderView = header
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AddCardTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AddCardTableViewCell.cellHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension AddCardTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddCardTableViewCell.id) as? AddCardTableViewCell
        return cell!
    }
}

class AddCardHeader: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "卡片详细信息"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "输入卡片信息"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(Layout.getNavigationBar().height+16)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
