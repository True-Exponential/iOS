//
//  StrUtils.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StrUtils {
    
    static public func unwrapString(value : String?) -> String {
        if let val = value {
            return val
        }
        
        return ""
    }
}
