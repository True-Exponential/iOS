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
    private var m_type : AccountType  = AccountType.Other
    private var m_subType : Int?
    private var m_typeDesc : String?
    private var m_subTypeDesc : String?
    private var m_balances : AccountBalance
    
    private var m_transactions = [Transaction]()
    private var m_holdings = [PlaidHolding]()
    private var m_creditLoans = [CreditLoan]()
    private var m_mortgages = [Mortgage]()
    private var m_studentLoans = [StudentLoan]()
    
    init(account: NSDictionary) {
        m_name = account["name"] as? String
        m_fullName = account["official_name"] as? String
        m_id = account["id"] as? String
        m_mask = account["mask"] as? String
        m_subType = account["subtype"] as? Int
        
        let intType = account["type"] as? Int
        if let type = intType {
            if let type = AccountType(rawValue: type) {
                m_type = type
            }
        }
        
        m_typeDesc = account["typeDesc"] as? String
        m_subTypeDesc = account["subTypeDesc"] as? String
        
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
    
    public func getType() -> AccountType {
        return self.m_type
    }
    
    public func getSubType() -> Int {
        return NumUtils.unwrapInt(value:m_subType);
    }
    
    public func getTypeDesc() -> String {
        return StrUtils.unwrapString(value:m_typeDesc);
    }
    
    public func getSubTypeDesc() -> String {
        return StrUtils.unwrapString(value:m_typeDesc);
    }
    
    public func getSubType() -> AccountBalance {
        return m_balances
    }
    
    public mutating func setTransactions(transactions : [Transaction]) {
        self.m_transactions = transactions
    }
    
    public mutating func setHoldings(holdings : [PlaidHolding]) {
        self.m_holdings = holdings
    }
    
    public mutating func setCreditLoans(creditLoans : [CreditLoan]) {
        self.m_creditLoans = creditLoans
    }
    
    public mutating func setMortgages(mortgages : [Mortgage]) {
        self.m_mortgages = mortgages
    }
    
    public mutating func setStudentLoans(studentLoans : [StudentLoan]) {
        m_studentLoans = studentLoans
    }
    
    public func getTransactions() -> [Transaction] {
        return m_transactions;
    }
    
    public func getHoldings() -> [PlaidHolding] {
        return m_holdings;
    }
    
    public func getCreditLoans() -> [CreditLoan] {
        return m_creditLoans;
    }
    
    public func getMortgages() -> [Mortgage] {
        return m_mortgages;
    }
    
    public func getStudentLoans() -> [StudentLoan] {
        return m_studentLoans;
    }
}
