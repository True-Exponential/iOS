//
//  AccountBalance.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct AccountBalance :  Codable {
    
    init(balances: NSDictionary) {
        available = balances["available"] as? Int
        limit = balances["limit"] as? Int
        current = balances["current"] as? Int
    }
    
    public func getCurrent() -> Int {
        return NumUtils.unwrapInt(value: current)
    }
    
    public func getAvailable() -> Int {
        return NumUtils.unwrapInt(value: available)
    }
    
    public func getLimit() -> Int {
        return NumUtils.unwrapInt(value: limit)
    }
    
    private var current : Int?
    private var limit : Int?
    private var available : Int?
}
