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
        if let val = value {
            return val
        }
        
        return 0
    }
    
    static public func unwrap(_ value : String?) -> String {
        if let val = value {
            return val
        }
        
        return ""
    }
    
    static public func unwrap(_ value : Bool?) -> Bool {
        if let val = value {
            return val
        }
        
        return false
    }
    
    static public func unwrap(_ value : Double?) -> Double {
        if let val = value {
            return val
        }
        
        return 0
    }
}
