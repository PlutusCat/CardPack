//
//  BaseTableView.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/25.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0,
                                    left: 0,
                                    bottom: Layout.getSafeArea().bottom,
                                    right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

