//
//  account.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 05/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct AccountBalance {
    private var m_current : Int?
    private var m_limit : Int?
    private var m_available : Int?
    
    init(balances: NSDictionary) {
        m_available = balances["available"] as? Int
        m_limit = balances["limit"] as? Int
        m_current = balances["current"] as? Int
    }
    
    public func getCurrent() -> Int {
        return NumUtils.unwrapInt(value: m_current)
    }
    
    public func getAvailable() -> Int {
        return NumUtils.unwrapInt(value: m_available)
    }
    
    public func getLimit() -> Int {
        return NumUtils.unwrapInt(value: m_limit)
    }
}

struct PlaidAccount {
    
    private var m_name : String?
    private var m_fullName : String?
    private var m_mask : String?
    private var m_id : String?
    private var m_type : String?
    private var m_subType : String?
    private var m_balances : AccountBalance
    
    init(account: NSDictionary) {
        m_name = account["name"] as? String
        m_fullName = account["official_name"] as? String
        m_id = account["account_id"] as? String
        m_mask = account["mask"] as? String
        m_type = account["type"] as? String
        m_subType = account["subtype"] as? String
        
        let balances = account["balances"] as! NSDictionary
        m_balances = AccountBalance(balances:balances)
    }
    
    public func getName() -> String {
        return StrUtils.unwrapString(value: m_name);
    }
    
    public func getFullName() -> String {
        return StrUtils.unwrapString(value:m_fullName);
    }
    
    public func getId() -> String {
        return StrUtils.unwrapString(value:m_id);
    }
    
    public func getType() -> String {
        return StrUtils.unwrapString(value:m_type);
    }
    
    public func getSubType() -> String {
        return StrUtils.unwrapString(value:m_subType);
    }
    
    public func getSubType() -> AccountBalance {
        return m_balances
    }
}
