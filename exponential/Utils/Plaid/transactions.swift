//
//  transactions.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation
import Charts

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
            if let insights = data["insights"]! as? NSDictionary {
                self.insights = Insights(insights)
            }
            
            let transactions = data["transactions"]! as? [Any] ?? []
            for _transaction in transactions {
                if let transaction = _transaction as? NSDictionary {
                    self.transactions.append(TransactionEx(transaction))
                }
            }
            
            self.appendTransactinosToAccounts()
        }
    }
    
    func dataEntriesBarChar() -> [BarChartDataEntry] {
        
        var totalTransPerMonth  = Array<Double>(repeating : 0, count :12)
        
        for transaction in transactions {
            let month = StrUtils.getMonth(transaction.getDate())
            if (month != 0) {
                totalTransPerMonth[month-1] += transaction.getAmount()
            }
        }
        
        let array = totalTransPerMonth.enumerated().map { BarChartDataEntry(x:Double($0), y: $1)}
        
        return array
    }
    
    /*func dataEntriesPieChar() -> [PieChartDataEntry] {
        
        var totalTransPerMonth  = Array<Double>(repeating : 0, count :12)
        
        for transaction in transactions {
            let month = StrUtils.getMonth(transaction.getDate())
            if (month != 0) {
                totalTransPerMonth[month-1] += transaction.getAmount()
            }
        }
        
        let array = totalTransPerMonth.enumerated().map { PieChartDataEntry(x:Double($0), y: $1)}
        
        return array
    }*/
     
    
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
    
    func getInsights() -> Insights {insights}
    
    private var transactions = [TransactionEx]()
    private var insights = Insights()
    
}
