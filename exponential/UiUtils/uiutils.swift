//
//  uiutils.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 12/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

struct UIUtils {
    static func getAccountImage(_ _accout : Account?) -> String {
        guard let account = _accout else {
            return ""
        }
        
        switch(account.getType()) {
        case .deposit, .other:
            return "deposit"
            
        case .credit:
            return "credit"
            
        case .loan:
            return "loans"
            
        case .investment, .brokerage:
            return "savings"
        }
    }
    
    static func getTransactionImage(_ _transaction : TransactionEx?) -> String {
        guard let transaction = _transaction else {
            return ""
        }
        
        return "transaction"
    }
    
    
}
