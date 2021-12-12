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
    private var m_securities: Array = [PlaidSecurity]()
    
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
    
    private func getAccountsCallBack(json : [String: Any]?) {
        if (json != nil) {
            let accounts = json!["accounts"]! as? Array<Any>
            
            if (accounts != nil) {
                for account in accounts! {
                    let pldAccount = PlaidAccount(account:account as! NSDictionary)
                    self.m_accounts.append(pldAccount)
                }
            }
        }
    }
    
    private func getTransactionsCallBack(json : [String: Any]?) {
        if (json != nil) {
            let transactions = json!["transactions"]! as? Array<Any>
            if (transactions != nil) {
                var accountTransactions = [String: [Transaction]]()
                
                for transaction in transactions! {
                    let pldTransaction = Transaction(transaction:transaction as! NSDictionary)
                    
                    let accountId = pldTransaction.getAccountId()
                    let account = accountTransactions[accountId]
                    
                    if (account == nil) {
                        accountTransactions[accountId] = [Transaction]()
                    }
                    
                    accountTransactions[accountId]?.append(pldTransaction)
                    
                    self.m_transactions.append(pldTransaction)
                }
                
                for transactions in accountTransactions {
                    let account = self.getAccountById(id: transactions.key)
                    if var _account = account {
                        _account.setTransactions(transactions : transactions.value)
                    }
                }
            }
        }
    }
    
    private func getHoldingsCallBack(json : [String: Any]?) {
        if (json != nil) {
            let securities = json!["securities"]! as? Array<Any>
            if (securities != nil) {
                m_securities.removeAll()
                
                for secutiry in securities! {
                    let pldSecutiry = PlaidSecurity(security:secutiry as! NSDictionary)
                    m_securities.append(pldSecutiry)
                }
            }
            
            let holdings = json!["holdings"]! as? Array<Any>
            if (holdings != nil) {
                var accountHoldings = [String: [PlaidHolding]]()
                
                for holding in holdings! {
                    let pldHolding = PlaidHolding(holding:holding as! NSDictionary)
                    
                    let accountId = pldHolding.getAccountId()
                    let account = accountHoldings[accountId]
                    
                    if (account == nil) {
                        accountHoldings[accountId] = [PlaidHolding]()
                    }
                    
                    accountHoldings[accountId]?.append(pldHolding)
                }
                
                for holdings in accountHoldings {
                    let account = self.getAccountById(id: holdings.key)
                    if var _account = account {
                        _account.setHoldings(holdings: holdings.value)
                    }
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
            NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetAccounts", token: self.m_accessToken,  extraParams:nil, callback: self.getAccountsCallBack)
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetTransactions", token: self.m_accessToken,  extraParams:["startDate" : "2019-01-01", "endDate" : "2021-05-10", "account_ids": ["MeoKpvMlvlU3eQPzzz37Iry3r9xog3u94LwLl"]], callback: self.getTransactionsCallBack)*/
            
            NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetHoldings", token: self.m_accessToken,  extraParams:["account_ids": ["gekm4KVpKpUAX7pyyyABIpGWpyoLdWtgLEaEZ"]], callback: self.getHoldingsCallBack)
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetHoldings", token: self.m_accessToken,  extraParams:nil, callback: self.getHoldingsCallBack)*/
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
    
    public func getAccountById(id : String) -> PlaidAccount? {
        for account in m_accounts {
            if (account.getId() == id) {
                return account
            }
        }
        
        return nil
    }
    
    public func getSecutiryById(id : String) -> PlaidSecurity? {
        for security in m_securities {
            if (security.getId() == id) {
                return security
            }
        }
        
        return nil
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
