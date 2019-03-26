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

    private var models: Results<CardPositiveModel>?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        delegate = self
        dataSource = self
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
        
        readFromRealm()
        
    }
    
    func reload(with data: CardPositiveModel) {
        readFromRealm()
        
        let indexPath = IndexPath(row: 0, section: 0)
        insertRows(at: [indexPath], with: .automatic)
        
    }
    
    private func readFromRealm(isAscending: Bool = false) {
        let realm = try! Realm()
        guard let _ = realm.objects(CardPositiveModel.self).last else {
            return
        }
        /// 根据时间戳主键倒序获取存入数据
        models = realm.objects(CardPositiveModel.self).sorted(byKeyPath: "key",
                                                              ascending: isAscending)
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
        guard let count = models?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id) as? MainTableViewCell
        guard let model = models?[indexPath.row] else {
            return cell!
        }
        cell?.reload(with: model)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
