//
//  PlaidHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 28/11/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import SwiftUI
import Foundation
import LinkKit

class PlaidHandler {
    
    static private let ACCESS_TOKEN_KEY_NAME = "plaidAccessToken"
    
    private var m_linkToken = ""
    private var m_accessToken = ""
    
    private var m_accounts: Array = [PlaidAccount]()
    private var m_transactions: Array = [Transaction]()
    private var m_accountTransactions = [String: [Transaction]]()
    
    private var dummyData = DummyData()
    
    func getLinkToken(dispatch : DispatchGroup) {
        NetworkHandler.sendGetRequest(dispatch: dispatch, url: "plaidGetLinkToken", callback: self.getLinkTokenCallBack)
    }
    
    func getAccessToken(publicToken: String, dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "plaidpublictoken2accesstoken", token: publicToken, extraParams: nil, callback: self.getAccessTokenCallBack)
    }
    
    private func getLinkTokenCallBack(json : [String: Any]?) {
        if (json != nil) {
            self.setLinkToken(linkToken: json!["token"] as! String)
        }
    }
    
    private func getTransactionsCallBack(json : [String: Any]?) {
        if (json != nil) {
            let accounts = json!["accounts"]! as? Array<Any>
            
            if (accounts != nil) {
                for account in accounts! {
                    let pldAccount = PlaidAccount(account:account as! NSDictionary)
                    self.m_accounts.append(pldAccount)
                }
            }
            
            let transactions = json!["transactions"]! as? Array<Any>
            if (transactions != nil) {
                for transaction in transactions! {
                    let pldTransaction = Transaction(transaction:transaction as! NSDictionary)
                    let account = self.m_accountTransactions[pldTransaction.getAccountId()]
                    
                    if (account == nil) {
                        self.m_accountTransactions[pldTransaction.getAccountId()] = [Transaction]()
                    }
                    
                    self.m_accountTransactions[pldTransaction.getAccountId()]?.append(pldTransaction)
                    
                    self.m_transactions.append(pldTransaction)
                }
            }
        }
    }
    
    private func getAccessTokenCallBack(json : [String: Any]?) {
        if (json != nil) {
            self.setAccessToken(accessToken: json!["token"] as! String)
        }
    }
    
    func retrieveAccounts(dispatch : DispatchGroup?) {
        if (Globals.plaidMode) {
            NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetTransactions", token: self.m_accessToken,  extraParams:["startDate" : "2019-01-01", "endDate" : "2021-05-10"], callback: self.getTransactionsCallBack)
        }
        else {
            let accounts = dummyData.accounts
            
            for account in accounts {
                let pldAccount = PlaidAccount(account:account as! NSDictionary)
                self.m_accounts.append(pldAccount)
            }
            
            let transactions = dummyData.transactions
            
            for transaction in transactions {
                let pldTransaction = Transaction(transaction:transaction as! NSDictionary)
                self.m_transactions.append(pldTransaction)
            }
        }
    }
    
    public func getAccount(index : Int) -> PlaidAccount {
        return m_accounts[index]
    }
    
    public func getNumAccounts() -> Int {
        return m_accounts.count;
    }
    
    func getCurrLinkToken() -> String {
        return self.m_linkToken
    }
    
    func getCurrAccessToken() -> String {
        if (self.m_accessToken.count > 0) {
            return self.m_accessToken
        }
        else {
            let defaults = UserDefaults.standard
            
            let storedAccessToken = defaults.string(forKey: PlaidHandler.ACCESS_TOKEN_KEY_NAME)
            if let accessToken = storedAccessToken {
                self.m_accessToken = accessToken
            }
        }
        
        return self.m_accessToken
    }
    
    func setLinkToken(linkToken : String) {
        self.m_linkToken = linkToken;
    }
    
    func setAccessToken(accessToken : String) {
        self.m_accessToken = accessToken;
        
        let defaults = UserDefaults.standard
        defaults.set(self.m_accessToken, forKey: PlaidHandler.ACCESS_TOKEN_KEY_NAME)
    }
    
    
    
}
