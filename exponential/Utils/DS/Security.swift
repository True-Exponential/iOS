//
//  Security.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 09/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PlaidSecurity {
    
    private var m_name : String?
    private var m_closeDate : String?
    private var m_cusip : String?
    private var m_institutionId : String?
    private var m_institutionSecurityId : String?
    private var m_isin : String?
    private var m_currencyCode : String?
    private var m_unofficialCurrencyCode : String?
    private var m_proxySecurityId : String?
    private var m_securityId : String?
    private var m_sedol : String?
    private var m_tickerSymbol : String?
    private var m_type : String?
    
    private var m_isCashEquivalent : Bool?
    private var m_closePrice :Float?
    
    init(security: NSDictionary) {
        
        m_name = security["name"] as? String
        m_closeDate = security["close_price_as_of"] as? String
        m_cusip = security["cusip"] as? String
        m_institutionId = security["institution_id"] as? String
        m_institutionSecurityId = security["institution_security_id"] as? String
        m_isin = security["isin"] as? String
        m_currencyCode = security["iso_currency_code"] as? String
        m_unofficialCurrencyCode = security["unofficial_currency_code"] as? String
        m_proxySecurityId = security["proxy_security_id"] as? String
        m_securityId = security["security_id"] as? String
        m_sedol = security["sedol"] as? String
        m_tickerSymbol = security["ticker_symbol"] as? String
        m_type = security["type"] as? String
        
        m_isCashEquivalent = security["is_cash_equivalent"] as? Bool
        m_closePrice = security["close_price"] as? Float
    }
    
    public func getName() -> String {
        return StrUtils.unwrapString(value: m_name);
    }
    
    public func getCloseDate() -> String {
        return StrUtils.unwrapString(value: m_closeDate);
    }
    
    public func getCusip() -> String {
        return StrUtils.unwrapString(value: m_cusip);
    }
    
    public func getInstitutionId() -> String {
        return StrUtils.unwrapString(value: m_institutionId);
    }
    
    public func getInstitutionSecurityId() -> String {
        return StrUtils.unwrapString(value: m_institutionSecurityId);
    }
    
    public func getIsin() -> String {
        return StrUtils.unwrapString(value: m_isin);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value: m_currencyCode);
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return StrUtils.unwrapString(value: m_unofficialCurrencyCode);
    }
    
    public func getProxySecurityId() -> String {
        return StrUtils.unwrapString(value: m_proxySecurityId);
    }
    
    public func getSecurityId() -> String {
        return StrUtils.unwrapString(value: m_securityId);
    }
    
    public func getSedol() -> String {
        return StrUtils.unwrapString(value: m_sedol);
    }
    
    public func getTickerSymbol() -> String {
        return StrUtils.unwrapString(value: m_tickerSymbol);
    }
    
    public func getType() -> String {
        return StrUtils.unwrapString(value: m_type);
    }
    
    public func getIsCashEquivalent() -> Bool {
        if let isCashEquivalent = m_isCashEquivalent {
            return isCashEquivalent;
        }
        
        return false;
    }
    
    public func getClosePrice() -> Float {
        return NumUtils.unwrapFloat(value:m_closePrice);
    }
}
