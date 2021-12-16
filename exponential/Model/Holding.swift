//
//  Holding.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 09/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Holding : Codable{
    
    init(holding: NSDictionary) {
        
        account_id = holding["account_id"] as? String
        security_id = holding["security_id"] as? String
        iso_currency_code = holding["iso_currency_code"] as? String
        unofficial_currency_code = holding["unofficial_currency_code"] as? String
        institution_price_as_of = holding["institution_price_as_of"] as? String

        cost_basis = holding["cost_basis"] as? Double
        institution_price = holding["institution_price"] as? Double
        institution_value = holding["institution_value"] as? Double
        quantity = holding["quantity"] as? Double
    }
    
    public func getAccountId() -> String {
        return StrUtils.unwrapString(value: account_id);
    }
    
    public func getSecurityId() -> String {
        return StrUtils.unwrapString(value: security_id);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value: iso_currency_code);
    }
    
    public func getUnofficialCurrencyCode() -> String {
        return StrUtils.unwrapString(value: unofficial_currency_code);
    }
    
    public func getInstitutionPriceAsOf() -> String {
        return StrUtils.unwrapString(value: institution_price_as_of);
    }
    
    public func getCostBasis() -> Double {
        return NumUtils.unwrapDouble(value: cost_basis);
    }
    
    public func getInstitutionPrice() -> Double {
        return NumUtils.unwrapDouble(value: institution_price);
    }
    
    public func getInstitutionValue() -> Double {
        return NumUtils.unwrapDouble(value: institution_value);
    }
    
    public func getQuantity() -> Double {
        return NumUtils.unwrapDouble(value: quantity);
    }
    
    private var account_id : String?
    private var security_id : String?
    private var iso_currency_code : String?
    private var unofficial_currency_code : String?
    private var institution_price_as_of : String?
    
    private var cost_basis :Double?
    private var institution_price :Double?
    private var institution_value :Double?
    private var quantity :Double?

}
