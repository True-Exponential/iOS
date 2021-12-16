//
//  Security.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 09/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Security : Codable {
    
    init(security: NSDictionary) {
        
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
    
    public func getName() -> String {
        return StrUtils.unwrapString(value: name);
    }
    
    public func getCloseDate() -> String {
        return StrUtils.unwrapString(value: close_price_as_of);
    }
    
    public func getCusip() -> String {
        return StrUtils.unwrapString(value: cusip);
    }
    
    public func getInstitutionId() -> String {
        return StrUtils.unwrapString(value: institution_id);
    }
    
    public func getInstitutionSecurityId() -> String {
        return StrUtils.unwrapString(value: institution_security_id);
    }
    
    public func getIsin() -> String {
        return StrUtils.unwrapString(value: isin);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value: iso_currency_code);
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return StrUtils.unwrapString(value: unofficial_currency_code);
    }
    
    public func getProxySecurityId() -> String {
        return StrUtils.unwrapString(value: proxy_security_id);
    }
    
    public func getId() -> String {
        return StrUtils.unwrapString(value: security_id);
    }
    
    public func getSedol() -> String {
        return StrUtils.unwrapString(value: sedol);
    }
    
    public func getTickerSymbol() -> String {
        return StrUtils.unwrapString(value: ticker_symbol);
    }
    
    public func getType() -> String {
        return StrUtils.unwrapString(value: type);
    }
    
    public func getIsCashEquivalent() -> Bool {
        if let isCashEquivalent = is_cash_equivalent {
            return isCashEquivalent;
        }
        
        return false;
    }
    
    public func getClosePrice() -> Double {
        return NumUtils.unwrapDouble(value:close_price);
    }
    
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
