//
//  AccountBalance.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct AccountBalance :  Codable {
    
    init() {
        current = Int.random(in: 1..<20000)
        limit = Int.random(in: 1..<20000) + current!
        available = Int.random(in: 1..<15000)
    }
    
    init(_ balances: NSDictionary) {
        available = balances["available"] as? Int
        limit = balances["limit"] as? Int
        current = balances["current"] as? Int
        iso_currency_code = balances["iso_currency_code"] as? String
        unofficial_currency_code = balances["unofficial_currency_code"] as? String
    }
    
    func getCurrent() -> Int {OptUtils.unwrap(current)}
    func getAvailable() -> Int {OptUtils.unwrap(available)}
    func getLimit() -> Int {OptUtils.unwrap(limit)}
    func getCurrencyCode() -> String {OptUtils.unwrap(iso_currency_code)}
    func getUnofficialCurrencyCode() -> String {OptUtils.unwrap(unofficial_currency_code)}
    
    private var iso_currency_code: String?
    private var unofficial_currency_code: String?
    private var current : Int?
    private var limit : Int?
    private var available : Int?
}
