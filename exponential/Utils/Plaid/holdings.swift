//
//  holdings.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Holdings {
    init() {}
    
    init(_ holdings : [Holding]) {
        self.holdings = holdings
        self.appendHoldingsToAccounts()
    }
    
    init(_ json : [String: Any]?) {
        
        self.holdings = [Holding]()
    
        if let data = json {
            Globals.securities = Securities(data)
            
            let holdings = data["holdings"]! as? [Any] ?? []
            for holding in holdings {
                let newHolding = Holding(holding:holding as! NSDictionary)
                self.holdings.append(newHolding)
            }
            
            self.appendHoldingsToAccounts()
        }
    }
    
    private func appendHoldingsToAccounts() {
        var accountHoldings = [String: [Holding]]()
        
        for holding in holdings {
            
            let accountId = holding.getAccountId()
            let account = accountHoldings[accountId]
            
            if account == nil {
                accountHoldings[accountId] = [Holding]()
            }
            
            accountHoldings[accountId]?.append(holding)
        }
        
        Globals.accounts.appendHoldingsToAccounts(accountHoldings)
    }
    
    private var holdings = [Holding]()
}
