//
//  Finance.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

protocol Finance {
    
    func loadAccounts(dispatch : DispatchGroup)
    func loadTransactions(dispatch : DispatchGroup, accountIds: [String]?)
    func loadHoldings(dispatch : DispatchGroup, accountIds: [String]?)
    func loadLiabilities(dispatch : DispatchGroup, accountIds: [String]?)
    func loadCategories(dispatch : DispatchGroup)
    
    func getLinkToken(dispatch : DispatchGroup)
    func getLinkToken() -> String
    func setLinkToken(token : String)
    func getAccessToken(publicToken: String, dispatch : DispatchGroup)
            
}
