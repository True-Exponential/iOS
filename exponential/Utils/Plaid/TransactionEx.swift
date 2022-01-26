//
//  TransactionEx.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 29/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class TransactionEx : Transaction, Identifiable {
    
    var categoryDesc : String {
        Globals.categories.getCategoryDesc(getCategoryId(), getCategories())
    }
    
    var ammount : String {StrUtils.showNumberWithCurrency(getAmount() ,getCurrencyCode())}
    
}
