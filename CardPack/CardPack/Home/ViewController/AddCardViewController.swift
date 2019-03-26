//
//  AddCardViewController.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/25.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit
import RealmSwift

class AddCardViewController: BaseViewController {

    private lazy var tableview: AddCardTableView =  {
        let view = AddCardTableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Card"
        closeItem()
        saveItem()
        view.addSubview(tableview)
    }
    
    private func closeItem() {
        let image = UIImage(named: "close_icon")?.withRenderingMode(.alwaysOriginal)
        let closeItem = UIBarButtonItem(image: image,
                                        style: .plain,
                                        target: self,
                                        action:#selector(closeAction))
        navigationItem.leftBarButtonItem = closeItem
    }
    
    private func saveItem() {
        let image = UIImage(named: "save_icon")?.withRenderingMode(.alwaysOriginal)
        let saveItem = UIBarButtonItem(image: image,
                                       style: .plain,
                                       target: self,
                                       action:#selector(saveAction))
        navigationItem.rightBarButtonItem = saveItem
    }
    
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveAction() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = tableview.cellForRow(at: indexPath) as? AddCardTableViewCell else {
            return
        }
        
        let realm = try! Realm()
        let model = CardPositiveModel()
        model.key = Date().milliStamp
        model.cardNum = cell.textField.text ?? ""
        try! realm.write {
            realm.add(model)
        }
        
        closeAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableview.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
  
}
