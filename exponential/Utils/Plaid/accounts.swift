//
//  accounts.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation
import SwiftUI

let accountTitles = ["Deposit Accounts","Credit Cards","Loans","Investments","Brokerage","Other"]

struct Accounts {
    
    init() {}
    
    init(json : [String: Any]?) {
        if json != nil {
            let accounts = json!["accounts"]! as? Array<Any>
            
            if accounts != nil {
                for account in accounts! {
                    let accountEx = AccountEx(account:account as! NSDictionary)
                    m_accounts.append(accountEx)
                }
                self.sortAccounts()
            }
        }
    }
    
    init(_ accounts : [Account]) {
        for account in accounts {
            let accountEx = AccountEx(account: account)
            m_accounts.append(accountEx)
        }
        
        self.sortAccounts()
    }
    
    private mutating func sortAccounts() {
        
        for account in m_accounts {
            switch(account.getType()) {
            case .Deposit:
                m_depositAccounts.append(account)
            case .Credit:
                m_creditAccounts.append(account)
            case .Loan:
                m_loanAccounts.append(account)
            case .Investment:
                m_investmentsAccounts.append(account)
            case .Brokerage:
                m_brokerageAccounts.append(account)
            case .Other:
                m_otherAccounts.append(account)
            }
        }
        
        if m_depositAccounts.count != 0 {
            m_groupedAccounts.append(m_depositAccounts)
        }
        
        if m_creditAccounts.count != 0 {
            m_groupedAccounts.append(m_creditAccounts)
        }
        
        if m_loanAccounts.count != 0 {
            m_groupedAccounts.append(m_loanAccounts)
        }
        
        if m_investmentsAccounts.count != 0 {
            m_groupedAccounts.append(m_investmentsAccounts)
        }
        
        if m_brokerageAccounts.count != 0 {
            m_groupedAccounts.append(m_brokerageAccounts)
        }
        
        if m_otherAccounts.count != 0 {
            m_groupedAccounts.append(m_otherAccounts)
        }
    }
    
    public var NumAccountTypes : Int {
        get {
            return m_groupedAccounts.count
        }
    }
    
    public func getNumAccountType(_ order : Int) -> Int {
        return m_groupedAccounts[order].count
    }
    
    public func getAccountGroupCaption(_  order : Int) -> String {
        return accountTitles[m_groupedAccounts[order][0].getType().rawValue]
    }
    
    public func appendTransactionsToAccounts(_ accountTransactions: [String: [TransactionEx]]){
        for transactions in accountTransactions {
            let account = get(transactions.key)
            if let _account = account {
                _account.setTransactions(transactions.value)
            }
        }
    }
    
    public func appendHoldingsToAccounts(_ accountHoldings: [String: [Holding]]){
        for holdings in accountHoldings {
            let account = get(holdings.key)
            if let _account = account {
                _account.setHoldings(holdings.value)
            }
        }
    }
    
    public func appeendCreditLoansToAccounts(_ creditLoansByAccount: [String: [CreditLoan]]){
        for creditLoan in creditLoansByAccount {
            let account = Globals.accounts.get(creditLoan.key)
            if let _account = account {
                _account.setCreditLoans(creditLoan.value)
            }
        }
    }
    
    public func appeendMortgagesToAccounts(_ mortgagesByAccount: [String: [Mortgage]]){
        for mortgage in mortgagesByAccount {
            let account = Globals.accounts.get(mortgage.key)
            if let _account = account {
                _account.setMortgages(mortgage.value)
            }
        }
    }
    
    public func appeendStudentLoansToAccounts(_ studentLoansByAccount: [String: [StudentLoan]]){
        for studentLoan in studentLoansByAccount {
            let account = Globals.accounts.get(studentLoan.key)
            if let _account = account {
                _account.setStudentLoans(studentLoan.value)
            }
        }
    }
    
    public func get(_ id : String) -> AccountEx? {
        for account in m_accounts {
            if account.getId() == id {
                return account
            }
        }
        
        return nil
    }
    
    public func get(_ index : Int) -> AccountEx? {
        var retAccount : AccountEx?
        
        if index < m_accounts.count {
            retAccount = m_accounts[index]
        }
        
        return retAccount
    }
    
    public func get(_ order: Int,_ index : Int) -> AccountEx? {
        var retAccount : AccountEx?
        
        if order < m_groupedAccounts.count {
            let groupedAccounts = m_groupedAccounts[order]
            
            if index < groupedAccounts.count {
                retAccount = groupedAccounts[index]
            }
        }
        
        return retAccount
    }
    
    public var count : Int {
        get {
            return m_accounts.count
        }
    }
    
    private var m_accounts: Array = [AccountEx]()
    
    private var m_groupedAccounts: Array = [[AccountEx]]()
    
    private var m_depositAccounts: Array = [AccountEx]()
    private var m_creditAccounts: Array = [AccountEx]()
    private var m_loanAccounts: Array = [AccountEx]()
    private var m_investmentsAccounts: Array = [AccountEx]()
    private var m_brokerageAccounts: Array = [AccountEx]()
    private var m_otherAccounts: Array = [AccountEx]()
}
