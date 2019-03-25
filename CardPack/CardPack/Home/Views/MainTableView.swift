//
//  MainTableView.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/20.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit
import RealmSwift

class MainTableView: BaseTableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        delegate = self
        dataSource = self
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
    }
    
    override func reloadData() {
        super.reloadData()
        let realm = try! Realm()
        let object = realm.objects(CardPositiveModel.self)
        
        for (index, model) in object.enumerated() {
            print(index)
            print("number =", model.cardNum)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainTableViewCell.cellHeight
    }
}

extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id) as? MainTableViewCell
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
}
