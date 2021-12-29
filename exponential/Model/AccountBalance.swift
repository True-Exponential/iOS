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
        iso_currency_code = balances["iso_currency_code"] as? String
        unofficial_currency_code = balances["unofficial_currency_code"] as? String
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
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value: iso_currency_code)
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return StrUtils.unwrapString(value: unofficial_currency_code)
    }
    
    private var iso_currency_code: String?
    private var unofficial_currency_code: String?
    private var current : Int?
    private var limit : Int?
    private var available : Int?
}
