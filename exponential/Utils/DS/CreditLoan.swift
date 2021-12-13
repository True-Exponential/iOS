//
//  CreditLiability.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct CreditLoan {
    
    private var m_accountId : String?

    private var m_lastPaymentDate : String?
    private var m_lastStatementIssueDate : String?
    private var m_nextPaymentDueDate : String?
    
    private var m_isOverdue : Bool?
    
    private var m_lastPaymentAmount : Double?
    private var m_lastStatementBalance : Double?
    private var m_minimumPaymentAmount : Double?
    
    private var m_aprs = [Apr]()
    
    init(creditLoanInfo: NSDictionary) {
        m_accountId = creditLoanInfo["account_id"] as? String
        m_lastPaymentDate = creditLoanInfo["last_payment_date"] as? String
        m_lastStatementIssueDate = creditLoanInfo["last_statement_issue_date"] as? String
        m_nextPaymentDueDate = creditLoanInfo["next_payment_due_date"] as? String
                
        m_isOverdue = creditLoanInfo["is_overdue"] as? Bool
        
        m_lastPaymentAmount = creditLoanInfo["last_payment_amount"] as? Double
        m_lastStatementBalance = creditLoanInfo["last_statement_balance"] as? Double
        m_minimumPaymentAmount = creditLoanInfo["minimum_payment_amount"] as? Double
        
        let aprs = creditLoanInfo["aprs"]! as? Array<NSDictionary>
        if (aprs != nil) {
            for aprInfo in aprs! {
                let apr = Apr(aprInfo:aprInfo)
                m_aprs.append(apr)
            }
        }
    }
    
    public func getAccountId() -> String {
        StrUtils.unwrapString(value: m_accountId)
    }
    
    public func getLastPaymentDate() -> String {
        StrUtils.unwrapString(value: m_lastPaymentDate)
    }
    
    public func getLastStatementIssueDate() -> String {
        StrUtils.unwrapString(value: m_lastStatementIssueDate)
    }
    public func getNextPaymentDueDate() -> String {
        StrUtils.unwrapString(value: m_nextPaymentDueDate)
    }
    
    public func getLastPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: m_lastPaymentAmount)
    }
    
    public func getLastStatementBalance() -> Double {
        return NumUtils.unwrapDouble(value: m_lastStatementBalance)
    }
    
    public func getMinimumPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: m_minimumPaymentAmount)
    }
    
    public func getIsOverdue() -> Bool {
        if let isOverdue = m_isOverdue {
            return isOverdue
        }
        
        return false
    }
}
