//
//  String+Extension.swift
//  CardPack
//
//  Created by cindata_mac on 2019/3/21.
//  Copyright © 2019 PlutusCat. All rights reserved.
//

import UIKit

extension String {
    func formatGroup() -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 4
        formatter.groupingSeparator = " "
        formatter.multiplier = 2
        let number = formatter.number(from: self)
        return formatter.string(from: number!) ?? ""
    }
}

extension String {
    func inValue() -> Int {
        
        var cgInt: Int = 0
        
        if let doubleValue = Double(self)
        {
            cgInt = Int(doubleValue)
        }
        return cgInt
    }
    
    func floatValue() -> CGFloat {
        var cgFloat: CGFloat = 0
        
        if let doubleValue = Double(self)
        {
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }
}
