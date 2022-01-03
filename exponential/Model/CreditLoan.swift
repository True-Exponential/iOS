//
//  CreditLiability.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct CreditLoan : Codable {
    
    init(creditLoanInfo: NSDictionary) {
        account_id = creditLoanInfo["account_id"] as? String
        last_payment_date = creditLoanInfo["last_payment_date"] as? String
        last_statement_issue_date = creditLoanInfo["last_statement_issue_date"] as? String
        next_payment_due_date = creditLoanInfo["next_payment_due_date"] as? String
                
        is_overdue = creditLoanInfo["is_overdue"] as? Bool
        
        last_payment_amount = creditLoanInfo["last_payment_amount"] as? Double
        last_statement_balance = creditLoanInfo["last_statement_balance"] as? Double
        minimum_payment_amount = creditLoanInfo["minimum_payment_amount"] as? Double
        
        let aprs = creditLoanInfo["aprs"]! as? [NSDictionary] ?? []
        for aprInfo in aprs {
            let apr = Apr(aprInfo:aprInfo)
            self.aprs.append(apr)
        }
    }
    
    public func getAccountId() -> String {OptUtils.unwrap(account_id)}
    public func getLastPaymentDate() -> String {OptUtils.unwrap(last_payment_date)}
    public func getLastStatementIssueDate() -> String {OptUtils.unwrap(last_statement_issue_date)}
    public func getNextPaymentDueDate() -> String {OptUtils.unwrap(next_payment_due_date)}
    public func getLastPaymentAmount() -> Double {OptUtils.unwrap(last_payment_amount)}
    public func getLastStatementBalance() -> Double {OptUtils.unwrap(last_statement_balance)}
    public func getMinimumPaymentAmount() -> Double {OptUtils.unwrap(minimum_payment_amount)}    
    public func getIsOverdue() -> Bool {OptUtils.unwrap(is_overdue)}
    
    private var account_id : String?

    private var last_payment_date : String?
    private var last_statement_issue_date : String?
    private var next_payment_due_date : String?
    
    private var is_overdue : Bool?
    
    private var last_payment_amount : Double?
    private var last_statement_balance : Double?
    private var minimum_payment_amount : Double?
    
    private var aprs = [Apr]()
}
