//
//  String+Extension.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/21.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

extension String {
    mutating func formattingGroup() {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 4
        formatter.groupingSeparator = " "
        formatter.multiplier = 2
        let number = formatter.number(from: self)
        self = formatter.string(from: number!) ?? ""
    }
}
