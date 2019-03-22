//
//  MainViewController.swift
//  Pixabay
//
//  Created by PlutusCat on 2018/6/11.
//  Copyright © 2018年 Pixabay. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {

    private lazy var tableview : MainTableView = {
        let view = MainTableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cards"
        addCardItem()
        view.addSubview(tableview)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        tableview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func addCardItem() {
        let image = UIImage(named: "addItem")?.withRenderingMode(.alwaysOriginal)
        let addItem = UIBarButtonItem(image: image, style: .plain, target: self, action:#selector(addCardAction))
        navigationItem.leftBarButtonItem = addItem
    }
    
    @objc private func addCardAction() {
        print("add Card ")
    }
    
}



