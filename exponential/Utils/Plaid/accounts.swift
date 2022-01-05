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
                self.accounts[accountEx.getId()] = accountEx
            }
            self.sortAccounts()
        }
    }
    
    init(_ accounts : [Account]) {
        for account in accounts {
            let accountEx = AccountEx(account: account)
            self.accounts[accountEx.getId()] = accountEx
        }
        
        self.sortAccounts()
    }
    
    private mutating func sortAccounts() {
        
        for account in self.accounts.values {
            switch(account.getType()) {
            case .deposit:
                depositAccounts.append(account)
            case .credit:
                creditAccounts.append(account)
            case .loan:
                loanAccounts.append(account)
            case .investment:
                investmentsAccounts.append(account)
            case .brokerage:
                brokerageAccounts.append(account)
            case .other:
                otherAccounts.append(account)
            }
        }
        
        if !depositAccounts.isEmpty {
            groupedAccounts.append(depositAccounts)
        }
        
        if !creditAccounts.isEmpty {
            groupedAccounts.append(creditAccounts)
        }
        
        if !loanAccounts.isEmpty {
            groupedAccounts.append(loanAccounts)
        }
        
        if !investmentsAccounts.isEmpty {
            groupedAccounts.append(investmentsAccounts)
        }
        
        if !brokerageAccounts.isEmpty {
            groupedAccounts.append(brokerageAccounts)
        }
        
        if !otherAccounts.isEmpty {
            groupedAccounts.append(otherAccounts)
        }
    }
    
    public var NumAccountTypes : Int {groupedAccounts.count}
    
    public func getNumAccountType(_ order : Int) -> Int {
        groupedAccounts[order].count
    }
    
    public func getAccountGroupCaption(_  order : Int) -> String {
        accountTitles[groupedAccounts[order][0].getType().rawValue]
    }
    
    public func appendTransactionsToAccounts(_ accountTransactions: [String: [TransactionEx]]){
        for transactions in accountTransactions {
            if let account = accounts[transactions.key] {
                account.setTransactions(transactions.value)
            }
        }
    }
    
    public func appendHoldingsToAccounts(_ accountHoldings: [String: [Holding]]){
        for holdings in accountHoldings {
            if let account = accounts[holdings.key] {
                account.setHoldings(holdings.value)
            }
        }
    }
    
    public func appeendCreditLoansToAccounts(_ creditLoansByAccount: [String: [CreditLoan]]){
        for creditLoan in creditLoansByAccount {
            if let account = accounts[creditLoan.key] {
                account.setCreditLoans(creditLoan.value)
            }
        }
    }
    
    public func appeendMortgagesToAccounts(_ mortgagesByAccount: [String: [Mortgage]]){
        for mortgage in mortgagesByAccount {
            if let account = accounts[mortgage.key] {
                account.setMortgages(mortgage.value)
            }
        }
    }
    
    public func appeendStudentLoansToAccounts(_ studentLoansByAccount: [String: [StudentLoan]]){
        for studentLoan in studentLoansByAccount {
            if let account = accounts[studentLoan.key] {
                account.setStudentLoans(studentLoan.value)
            }
        }
    }
    
    subscript(_ order: Int,_ index : Int) -> AccountEx? {
        var retAccount : AccountEx?
        
        if order < groupedAccounts.count {
            let groupedAccounts = groupedAccounts[order]
            
            if index < groupedAccounts.count {
                retAccount = groupedAccounts[index]
            }
        }
        
        return retAccount
    }
    
    var count : Int {accounts.count}
    
    private var accounts = [String: AccountEx]()
    
    private var groupedAccounts = [[AccountEx]]()
    
    private var depositAccounts = [AccountEx]()
    private var creditAccounts = [AccountEx]()
    private var loanAccounts = [AccountEx]()
    private var investmentsAccounts = [AccountEx]()
    private var brokerageAccounts = [AccountEx]()
    private var otherAccounts = [AccountEx]()
}
