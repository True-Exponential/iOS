//
//  TransactionEx.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 29/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class TransactionEx : Transaction {
    
    func getCategoryDesc() -> String {
        let category = Globals.categories.get(getCategoryId())
        
        var hierarchy = category.getHierarchy()
        
        if hierarchy.isEmpty {
            hierarchy = getCategories()
        }
            
        if hierarchy.count > 0 {
            return hierarchy[0]
        }
        
        return ""
    }
    
}
