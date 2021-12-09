//
//  NumUtils.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct NumUtils {
    static public func unwrapInt(value : Int?) -> Int {
        if let val = value {
            return val
        }
        
        return 0;
    }
    
    static public func unwrapFloat(value : Float?) -> Float {
        if let val = value {
            return val
        }
        
        return 0;
    }
}
