//
//  accounts.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Accounts {
    
    init() {}
    
    init(json : [String: Any]?) {
        if (json != nil) {
            let accounts = json!["accounts"]! as? Array<Any>
            
            if (accounts != nil) {
                for account in accounts! {
                    let pldAccount = AccountEx(account:account as! NSDictionary)
                    m_accounts.append(pldAccount)
                }
            }
        }
    }
    
    init(accounts : [Account]) {
        for account in accounts {
            let accountEx = AccountEx(account: account)
            
            m_accounts.append(accountEx)
        }
    }
    
    public func appendTransactionsToAccounts(accountTransactions: [String: [Transaction]]){
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
    
    public func getCount() -> Int {
        return m_accounts.count;
    }
    
    private var m_accounts: Array = [AccountEx]()
}
