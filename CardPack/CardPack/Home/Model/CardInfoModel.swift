//
//  CardInfoModel.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/20.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit
import RealmSwift

class CardPositiveModel: Object {
    @objc dynamic var key = "CardPositiveModel_key"
    @objc dynamic var iconName = ""
    @objc dynamic var bankName = ""
    @objc dynamic var cardType = ""
    @objc dynamic var cardNum = ""
    @objc dynamic var isChinaUnionPay = true
    @objc dynamic var isVisa = false

    override static func primaryKey() -> String? {
        return "key"
    }
    override static func indexedProperties() -> [String] {
        return ["cardNum"]
    }
}
