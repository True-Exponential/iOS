//
//  PlaidDemoHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PlaidDemoHandler : Finance {
    
    func loadAccounts(_ dispatch : DispatchGroup) {
        let accounts : [Account] = load("accounts.json")
        Globals.accounts = Accounts(accounts)
        
        dispatch.leave()
    }
    
    func loadTransactions(_ dispatch : DispatchGroup,_ accountIds: [String]?) {
        let transactions : [Transaction] = load("transactions.json")
        Globals.transactions = Transactions(transactions)
        
        dispatch.leave()
    }
    
    func loadCategories(_ dispatch : DispatchGroup) {
        let categories : [Category] = load("categories.json")
        Globals.categories = Categories(categories)
        
        dispatch.leave()
    }
    
    public func loadHoldings(_ dispatch : DispatchGroup, _ accountIds: [String]?) {
        
        let securities : [Security] = load("securities.json")
        Globals.securities = Securities(securities)
        
        let holdings : [Holding] = load("holdings.json")
        Globals.holdings = Holdings(holdings)
        
        dispatch.leave()
    }
    
    public func loadLiabilities(_ dispatch : DispatchGroup,_  accountIds: [String]?) {
        let mortgages : [Mortgage] = load("mortgages.json")
        let creditLoans : [CreditLoan]  = load("creditloans.json")
        let studentLoans : [StudentLoan]  = load("studentloans.json")
        
        Globals.liablities = Liablities(mortgages, creditLoans, studentLoans)
    }
    
    func getLinkToken() -> String {return ""}
    func setLinkToken(_ token : String) {}
    
    func getLinkToken(_ dispatch : DispatchGroup){}
    func getAccessToken(_ publicToken: String,_ dispatch : DispatchGroup) {}
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
