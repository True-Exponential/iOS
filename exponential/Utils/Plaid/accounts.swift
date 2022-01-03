//
//  accounts.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation
import SwiftUI

let accountTitles = ["Deposit Accounts","Credit Cards","Loans","Investments","Brokerage","Other"]

struct Accounts {
    
    init() {}
    
    init(_ json : [String: Any]?) {
        if let data = json {
            let accounts = data["accounts"]! as? [Any] ?? []
            
            for account in accounts {
                let accountEx = AccountEx(account:account as! NSDictionary)
                m_accounts[accountEx.getId()] = accountEx
            }
            self.sortAccounts()
        }
    }
    
    init(_ accounts : [Account]) {
        for account in accounts {
            let accountEx = AccountEx(account: account)
            m_accounts[accountEx.getId()] = accountEx
        }
        
        self.sortAccounts()
    }
    
    private mutating func sortAccounts() {
        
        for account in m_accounts.values {
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
        
        if !m_depositAccounts.isEmpty {
            m_groupedAccounts.append(m_depositAccounts)
        }
        
        if !m_creditAccounts.isEmpty {
            m_groupedAccounts.append(m_creditAccounts)
        }
        
        if !m_loanAccounts.isEmpty {
            m_groupedAccounts.append(m_loanAccounts)
        }
        
        if !m_investmentsAccounts.isEmpty {
            m_groupedAccounts.append(m_investmentsAccounts)
        }
        
        if !m_brokerageAccounts.isEmpty {
            m_groupedAccounts.append(m_brokerageAccounts)
        }
        
        if !m_otherAccounts.isEmpty {
            m_groupedAccounts.append(m_otherAccounts)
        }
    }
    
    public var NumAccountTypes : Int {
        get {
            m_groupedAccounts.count
        }
    }
    
    public func getNumAccountType(_ order : Int) -> Int {
        m_groupedAccounts[order].count
    }
    
    public func getAccountGroupCaption(_  order : Int) -> String {
        accountTitles[m_groupedAccounts[order][0].getType().rawValue]
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
            if let account = get(holdings.key) {
                account.setHoldings(holdings.value)
            }
        }
    }
    
    public func appeendCreditLoansToAccounts(_ creditLoansByAccount: [String: [CreditLoan]]){
        for creditLoan in creditLoansByAccount {
            if let account = Globals.accounts.get(creditLoan.key) {
                account.setCreditLoans(creditLoan.value)
            }
        }
    }
    
    public func appeendMortgagesToAccounts(_ mortgagesByAccount: [String: [Mortgage]]){
        for mortgage in mortgagesByAccount {
            if let account = Globals.accounts.get(mortgage.key) {
                account.setMortgages(mortgage.value)
            }
        }
    }
    
    public func appeendStudentLoansToAccounts(_ studentLoansByAccount: [String: [StudentLoan]]){
        for studentLoan in studentLoansByAccount {
            if let account = Globals.accounts.get(studentLoan.key) {
                account.setStudentLoans(studentLoan.value)
            }
        }
    }
    
    public func get(_ id : String) -> AccountEx? {m_accounts[id]}
    
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
            m_accounts.count
        }
    }
    
    private var m_accounts = [String: AccountEx]()
    
    private var m_groupedAccounts = [[AccountEx]]()
    
    private var m_depositAccounts = [AccountEx]()
    private var m_creditAccounts = [AccountEx]()
    private var m_loanAccounts = [AccountEx]()
    private var m_investmentsAccounts = [AccountEx]()
    private var m_brokerageAccounts = [AccountEx]()
    private var m_otherAccounts = [AccountEx]()
}
