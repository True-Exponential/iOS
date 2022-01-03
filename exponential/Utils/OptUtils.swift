//
//  NumUtils.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct OptUtils {
    static public func unwrap(_ value : Int?) -> Int {
        return value ?? 0
    }
    
    static public func unwrap(_ value : String?) -> String {
        return value ?? ""
    }
    
    static public func unwrap(_ value : Bool?) -> Bool {
        return value ?? false
    }
    
    static public func unwrap(_ value : Double?) -> Double {
        return value ?? 0
    }
}
