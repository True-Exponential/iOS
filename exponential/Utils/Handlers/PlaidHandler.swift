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
    
    private var linkToken = ""
    private var accessToken = ""
    
    private var m_accounts: Array = [PlaidAccount]()
    private var m_transactions: Array = [Transaction]()
    private var m_accountTransactions = [String: [Transaction]]()
    
    private var dummyData = DummyData()
    
    public func getAccount(index : Int) -> PlaidAccount {
        return m_accounts[index]
    }
    
    public func getNumAccounts() -> Int {
        return m_accounts.count;
    }
    
    func getCurrLinkToken() -> String {
        return self.linkToken
    }
    
    private func getLinkTokenCallBack(json : [String: Any]?) {
        if (json != nil) {
            self.linkToken = json!["token"] as! String
        }
    }
    
    func getLinkToken(dispatch : DispatchGroup) {
        NetworkHandler.sendGetRequest(dispatch: dispatch, url: "plaidGetLinkToken", callback: self.getLinkTokenCallBack)
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
            self.accessToken = json!["token"] as! String
        }
    }
    
    func getAccessToken(publicToken: String, dispatch : DispatchGroup) {
        
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "plaidpublictoken2accesstoken", token: publicToken, extraParams: nil, callback: self.getAccessTokenCallBack)
    }
    
    func retrieveAccounts(dispatch : DispatchGroup?) {
        if (Globals.plaidMode) {
            NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetTransactions", token: self.accessToken,  extraParams:["startDate" : "2019-01-01", "endDate" : "2021-05-10"], callback: self.getTransactionsCallBack)
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
    
}
