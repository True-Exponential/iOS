//
//  PlaidDemoHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PlaidDemoHandler : Finance {
    
    func loadAccounts(dispatch : DispatchGroup) {
        let accounts : [Account] = load("accounts.json")
        Globals.accounts = Accounts(accounts:accounts)
        
        dispatch.leave()
    }
    
    func loadTransactions(dispatch : DispatchGroup, accountIds: [String]?) {
        let transactions : [Transaction] = load("transactions.json")
        Globals.transactions = Transactions(transactions:transactions)
        
        dispatch.leave()
    }
    
    public func loadHoldings(dispatch : DispatchGroup, accountIds: [String]?) {
        
        let securities : [Security] = load("securities.json")
        Globals.securities = Securities(securities:securities)
        
        let holdings : [Holding] = load("holdings.json")
        Globals.holdings = Holdings(holdings:holdings)
        
        dispatch.leave()
    }
    
    public func loadLiabilities(dispatch : DispatchGroup, accountIds: [String]?) {
        let mortgages : [Mortgage] = load("mortgages.json")
        let creditLoans : [CreditLoan]  = load("creditloans.json")
        let studentLoans : [StudentLoan]  = load("studentloans.json")
        
        Globals.liablities = Liablities(mortgages:mortgages, creditLoans:creditLoans, studentLoans:studentLoans)
    }
    
    func getLinkToken() -> String {return ""}
    func setLinkToken(token : String) {}
    
    func getLinkToken(dispatch : DispatchGroup){}
    func getAccessToken(publicToken: String, dispatch : DispatchGroup) {}
    
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
