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
    
    private var m_costBasis :Double?
    private var m_institutionPrice :Double?
    private var m_institutionValue :Double?
    private var m_quantity :Double?
    
    init(holding: NSDictionary) {
        
        m_accountId = holding["account_id"] as? String
        m_securityId = holding["security_id"] as? String
        m_currencyCode = holding["iso_currency_code"] as? String
        m_unofficialCurrencyCode = holding["unofficial_currency_code"] as? String
        m_institutionPriceAsOf = holding["institution_price_as_of"] as? String

        m_costBasis = holding["cost_basis"] as? Double
        m_institutionPrice = holding["institution_price"] as? Double
        m_institutionValue = holding["institution_value"] as? Double
        m_quantity = holding["quantity"] as? Double
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
    
    public func getCostBasis() -> Double {
        return NumUtils.unwrapDouble(value: m_costBasis);
    }
    
    public func getInstitutionPrice() -> Double {
        return NumUtils.unwrapDouble(value: m_institutionPrice);
    }
    
    public func getInstitutionValue() -> Double {
        return NumUtils.unwrapDouble(value: m_institutionValue);
    }
    
    public func getQuantity() -> Double {
        return NumUtils.unwrapDouble(value: m_quantity);
    }
}
