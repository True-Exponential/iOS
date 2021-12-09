//
//  Holding.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 09/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PlaidHolding {
    
    private var m_accountId : String?
    private var m_securityId : String?
    private var m_currencyCode : String?
    private var m_unofficialCurrencyCode : String?
    private var m_institutionPriceAsOf : String?
    
    private var m_costBasis :Float?
    private var m_institutionPrice :Float?
    private var m_institutionValue :Float?
    private var m_quantity :Float?
    
    init(security: NSDictionary) {
        
        m_accountId = security["account_id"] as? String
        m_securityId = security["security_id"] as? String
        m_currencyCode = security["iso_currency_code"] as? String
        m_unofficialCurrencyCode = security["unofficial_currency_code"] as? String
        m_institutionPriceAsOf = security["institution_price_as_of"] as? String

        m_costBasis = security["cost_basis"] as? Float
        m_institutionPrice = security["institution_price"] as? Float
        m_institutionValue = security["institution_value"] as? Float
        m_quantity = security["quantity"] as? Float
    }
    
    public func getAccountId() -> String {
        return StrUtils.unwrapString(value: m_accountId);
    }
    
    public func getSecurityId() -> String {
        return StrUtils.unwrapString(value: m_securityId);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value: m_currencyCode);
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return StrUtils.unwrapString(value: m_unofficialCurrencyCode);
    }
    
    public func getInstitutionPriceAsOf() -> String {
        return StrUtils.unwrapString(value: m_institutionPriceAsOf);
    }
    
    public func getCostBasis() -> Float {
        return NumUtils.unwrapFloat(value: m_costBasis);
    }
    
    public func getInstitutionPrice() -> Float {
        return NumUtils.unwrapFloat(value: m_institutionPrice);
    }
    
    public func getInstitutionValue() -> Float {
        return NumUtils.unwrapFloat(value: m_institutionValue);
    }
    
    public func getQuantity() -> Float {
        return NumUtils.unwrapFloat(value: m_quantity);
    }
}
