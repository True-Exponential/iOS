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
        if (json != nil) {
            let accounts = json!["accounts"]! as? Array<Any>
            
            if (accounts != nil) {
                for account in accounts! {
                    let accountEx = AccountEx(account:account as! NSDictionary)
                    m_accounts.append(accountEx)
                }
                self.sortAccounts()
            }
        }
    }
    
    init(accounts : [Account]) {
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
        
        if (m_depositAccounts.count != 0) {
            m_groupedAccounts.append(m_depositAccounts)
        }
        
        if (m_creditAccounts.count != 0) {
            m_groupedAccounts.append(m_creditAccounts)
        }
        
        if (m_loanAccounts.count != 0) {
            m_groupedAccounts.append(m_loanAccounts)
        }
        
        if (m_investmentsAccounts.count != 0) {
            m_groupedAccounts.append(m_investmentsAccounts)
        }
        
        if (m_brokerageAccounts.count != 0) {
            m_groupedAccounts.append(m_brokerageAccounts)
        }
        
        if (m_otherAccounts.count != 0) {
            m_groupedAccounts.append(m_otherAccounts)
        }
    }
    
    public func getNumAccountTypes() -> Int {
        return m_groupedAccounts.count
    }
    
    public func getNumAccountType(order : Int) -> Int {
        return m_groupedAccounts[order].count
    }
    
    public func getAccountGroupCaption( order : Int) -> String {
        return accountTitles[m_groupedAccounts[order][0].getType().rawValue]
    }
    
    public func appendTransactionsToAccounts(accountTransactions: [String: [TransactionEx]]){
        for transactions in accountTransactions {
            let account = get(id: transactions.key)
            if let _account = account {
                _account.setTransactions(transactions : transactions.value)
            }
        }
    }
    
    public func appendHoldingsToAccounts(accountHoldings: [String: [Holding]]){
        for holdings in accountHoldings {
            let account = get(id: holdings.key)
            if let _account = account {
                _account.setHoldings(holdings: holdings.value)
            }
        }
    }
    
    public func appeendCreditLoansToAccounts(creditLoansByAccount: [String: [CreditLoan]]){
        for creditLoan in creditLoansByAccount {
            let account = Globals.accounts.get(id: creditLoan.key)
            if let _account = account {
                _account.setCreditLoans(creditLoans: creditLoan.value)
            }
        }
    }
    
    public func appeendMortgagesToAccounts(mortgagesByAccount: [String: [Mortgage]]){
        for mortgage in mortgagesByAccount {
            let account = Globals.accounts.get(id: mortgage.key)
            if let _account = account {
                _account.setMortgages(mortgages:mortgage.value)
            }
        }
    }
    
    public func appeendStudentLoansToAccounts(studentLoansByAccount: [String: [StudentLoan]]){
        for studentLoan in studentLoansByAccount {
            let account = Globals.accounts.get(id: studentLoan.key)
            if var _account = account {
                _account.setStudentLoans(studentLoans:studentLoan.value)
            }
        }
    }
    
    public func get(id : String) -> AccountEx? {
        for account in m_accounts {
            if (account.getId() == id) {
                return account
            }
        }
        
        return nil
    }
    
    public func get(index : Int) -> AccountEx? {
        var retAccount : AccountEx?
        
        if (index < m_accounts.count) {
            retAccount = m_accounts[index]
        }
        
        return retAccount
    }
    
    public func get(order: Int, index : Int) -> AccountEx? {
        var retAccount : AccountEx?
        
        if (order < m_groupedAccounts.count) {
            let groupedAccounts = m_groupedAccounts[order]
            
            if (index < groupedAccounts.count) {
                retAccount = groupedAccounts[index]
            }
        }
        
        return retAccount
    }
    
    public func getCount() -> Int {
        return m_accounts.count;
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
