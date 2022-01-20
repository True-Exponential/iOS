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
        current = Double(Int.random(in: 1..<20000))
        limit = Double(Int.random(in: 1..<20000)) + current!
        available = Double(Int.random(in: 1..<15000))
    }
    
    init(_ balances: NSDictionary) {
        available = balances["available"] as? Double
        limit = balances["limit"] as? Double
        current = balances["current"] as? Double
        iso_currency_code = balances["iso_currency_code"] as? String
        unofficial_currency_code = balances["unofficial_currency_code"] as? String
    }
    
    func getCurrent() -> Double {OptUtils.unwrap(current)}
    func getAvailable() -> Double {OptUtils.unwrap(available)}
    func getLimit() -> Double {OptUtils.unwrap(limit)}
    func getCurrencyCode() -> String {OptUtils.unwrap(iso_currency_code)}
    func getUnofficialCurrencyCode() -> String {OptUtils.unwrap(unofficial_currency_code)}
    
    private var iso_currency_code: String?
    private var unofficial_currency_code: String?
    private var current : Double?
    private var limit : Double?
    private var available : Double?
}
