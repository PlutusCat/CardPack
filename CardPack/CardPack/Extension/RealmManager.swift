//
//  RealmManager.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/26.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import Foundation
import RealmSwift


class RealmManager {
    
    public class func realmMigration() {
        /* Realm 数据库配置，用于数据库的迭代更新 */
        
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyyMMddHHmmss"
        let version = timeFormatter.string(from: date).floatValue()
        
        let schemaVersion: UInt64 = UInt64(exactly: version)!
        let config = Realm.Configuration(schemaVersion: schemaVersion, migrationBlock: { migration, oldSchemaVersion in
            
            /* 什么都不要做！Realm 会自行检测新增和需要移除的属性，然后自动更新硬盘上的数据库架构 */
            if (oldSchemaVersion < schemaVersion) {}
        })
        Realm.Configuration.defaultConfiguration = config
        Realm.asyncOpen { (realm, error) in
            
            /* Realm 成功打开，迁移已在后台线程中完成 */
            if let _ = realm {
                print("Realm 数据库配置成功")
            }
                /* 处理打开 Realm 时所发生的错误 */
            else if let error = error {
                print("Realm 数据库配置失败：\(error.localizedDescription)")
            }
        }
    }
}
