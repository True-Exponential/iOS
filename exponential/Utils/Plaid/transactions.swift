//
//  transactions.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Transactions {
    
    init() {}
    
    init(transactions : [Transaction]) {
        self.transactions = transactions
        self.appendTransactinosToAccounts()
    }
    
    init(json : [String: Any]?) {
    
        self.transactions = [Transaction]()
        
        if (json != nil) {
            let transactions = json!["transactions"]! as? Array<Any>
            if (transactions != nil) {
                for transaction in transactions! {
                    let newTransaction = Transaction(transaction:transaction as! NSDictionary)
                    self.transactions.append(newTransaction)
                }
                
                self.appendTransactinosToAccounts()
            }
        }
    }
    
    private func appendTransactinosToAccounts() {
        var accountTransactions = [String: [Transaction]]()
        
        for transaction in transactions {
            
            let accountId = transaction.getAccountId()
            let account = accountTransactions[accountId]
            
            if (account == nil) {
                accountTransactions[accountId] = [Transaction]()
            }
            
            accountTransactions[accountId]?.append(transaction)
        }
        
        Globals.accounts.appendTransactionsToAccounts(accountTransactions: accountTransactions)
    }
    
    private var transactions: Array = [Transaction]()
    
}
