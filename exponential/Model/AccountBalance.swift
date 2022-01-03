//
//  AccountBalance.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct AccountBalance :  Codable {
    
    init() {
        available = 0
        limit = 0
        current = 0
        iso_currency_code = ""
        unofficial_currency_code = ""
    }
    
    init(_ balances: NSDictionary) {
        available = balances["available"] as? Int
        limit = balances["limit"] as? Int
        current = balances["current"] as? Int
        iso_currency_code = balances["iso_currency_code"] as? String
        unofficial_currency_code = balances["unofficial_currency_code"] as? String
    }
    
    public func getCurrent() -> Int {
        return OptUtils.unwrap(current)
    }
    
    public func getAvailable() -> Int {
        return OptUtils.unwrap(available)
    }
    
    public func getLimit() -> Int {
        return OptUtils.unwrap(limit)
    }
    
    public func getCurrencyCode() -> String {
        return OptUtils.unwrap(iso_currency_code)
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return OptUtils.unwrap(unofficial_currency_code)
    }
    
    private var iso_currency_code: String?
    private var unofficial_currency_code: String?
    private var current : Int?
    private var limit : Int?
    private var available : Int?
}
