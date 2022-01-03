//
//  Finance.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

protocol Finance {
    
    func loadAccounts(_ dispatch : DispatchGroup)
    func loadTransactions(_ dispatch : DispatchGroup,_  accountIds: [String]?)
    func loadHoldings(_ dispatch : DispatchGroup,_  accountIds: [String]?)
    func loadLiabilities(_ dispatch : DispatchGroup,_  accountIds: [String]?)
    func loadCategories(_ dispatch : DispatchGroup)
    
    func getLinkToken(_ dispatch : DispatchGroup)
    func getLinkToken() -> String
    func setLinkToken(_ token : String)
    func getAccessToken(_ publicToken: String, _ dispatch : DispatchGroup)
            
}
