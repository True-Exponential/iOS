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
    
    init(_ transactions : [Transaction]) {
        for transaction in transactions {
            let transactionEx = TransactionEx(transaction)
            self.transactions.append(transactionEx)
        }
        
        self.appendTransactinosToAccounts()
    }
    
    init(_ json : [String: Any]?) {
    
        self.transactions = [TransactionEx]()
        
        if let data = json {
            let transactions = data["transactions"]! as? [Any] ?? []
            for transaction in transactions {
                let newTransaction = TransactionEx(transaction as! NSDictionary)
                self.transactions.append(newTransaction)
            }
            
            self.appendTransactinosToAccounts()
        }
    }
    
    private func appendTransactinosToAccounts() {
        var accountTransactions = [String: [TransactionEx]]()
        
        for transaction in transactions {
            
            let accountId = transaction.getAccountId()
            let account = accountTransactions[accountId]
            
            if account == nil {
                accountTransactions[accountId] = [TransactionEx]()
            }
            
            accountTransactions[accountId]?.append(transaction)
        }
        
        Globals.accounts.appendTransactionsToAccounts(accountTransactions)
    }
    
    private var transactions = [TransactionEx]()
    
}
