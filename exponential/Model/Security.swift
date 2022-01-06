//
//  Security.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 09/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Security : Codable {
    
    init(_ security: NSDictionary) {
        
        name = security["name"] as? String
        close_price_as_of = security["close_price_as_of"] as? String
        cusip = security["cusip"] as? String
        institution_id = security["institution_id"] as? String
        institution_security_id = security["institution_security_id"] as? String
        isin = security["isin"] as? String
        iso_currency_code = security["iso_currency_code"] as? String
        unofficial_currency_code = security["unofficial_currency_code"] as? String
        proxy_security_id = security["proxy_security_id"] as? String
        security_id = security["security_id"] as? String
        sedol = security["sedol"] as? String
        ticker_symbol = security["ticker_symbol"] as? String
        type = security["type"] as? String
        
        is_cash_equivalent = security["is_cash_equivalent"] as? Bool
        close_price = security["close_price"] as? Double
    }
    
    func getName() -> String {OptUtils.unwrap(name)}
    
    func getCloseDate() -> String {OptUtils.unwrap(close_price_as_of)}
    func getCusip() -> String {OptUtils.unwrap(cusip)}
    func getInstitutionId() -> String {OptUtils.unwrap(institution_id)}
    func getInstitutionSecurityId() -> String {OptUtils.unwrap(institution_security_id)}
    func getIsin() -> String {OptUtils.unwrap(isin)}
    func getCurrencyCode() -> String {OptUtils.unwrap(iso_currency_code)}
    func getUnofficialCurrencyCode() -> String {OptUtils.unwrap(unofficial_currency_code)}
    func getProxySecurityId() -> String {OptUtils.unwrap(proxy_security_id)}
    func getId() -> String {OptUtils.unwrap(security_id)}
    func getSedol() -> String {OptUtils.unwrap(sedol)}
    func getTickerSymbol() -> String {OptUtils.unwrap(ticker_symbol)}
    func getType() -> String {OptUtils.unwrap(type)}
    func getIsCashEquivalent() -> Bool {OptUtils.unwrap(is_cash_equivalent)}
    func getClosePrice() -> Double {OptUtils.unwrap(close_price)}

    private var name : String?
    private var close_price_as_of : String?
    private var cusip : String?
    private var institution_id : String?
    private var institution_security_id : String?
    private var isin : String?
    private var iso_currency_code : String?
    private var unofficial_currency_code : String?
    private var proxy_security_id : String?
    private var security_id : String?
    private var sedol : String?
    private var ticker_symbol : String?
    private var type : String?
    
    private var is_cash_equivalent : Bool?
    private var close_price :Double?
    
    
}
