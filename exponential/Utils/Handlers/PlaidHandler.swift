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
    
    private var m_linkToken = ""
    
    private var m_accounts: Array = [PlaidAccount]()
    private var m_transactions: Array = [Transaction]()
    private var m_securities: Array = [PlaidSecurity]()
    private var m_liablities : Liablities?
    
    private var dummyData = DummyData()
    
    func getLinkToken(dispatch : DispatchGroup) {
        NetworkHandler.sendGetRequest(dispatch: dispatch, url: "plaidGetLinkToken", callback: self.getLinkTokenCallBack)
    }
    
    func getAccessToken(publicToken: String, dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "plaidpublictoken2accesstoken", token: Globals.userHandler.getUserToken(),
                                       extraParams: ["plaidPublicToken":publicToken], callback: self.getAccessTokenCallBack)
    }
    
    private func getLinkTokenCallBack(json : [String: Any]?) {
        if (json != nil) {
            self.setLinkToken(token: json!["token"] as! String)
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
    
    private func getLiabilitiesCallBack(json : [String: Any]?) {
        if (json != nil) {
            let liablities = json!["liabilities"]! as? NSDictionary
            if (liablities != nil) {
                m_liablities = Liablities(liablities: liablities!)
                
                if let liablities = m_liablities {
                    let creditLoans = liablities.getCreditLoans()
                    
                    var creditLoansByAccount = [String: [CreditLoan]]()
                    
                    for creditLoan in creditLoans {
                        let accountId = creditLoan.getAccountId()
                        let account = creditLoansByAccount[accountId]
                        
                        if (account == nil) {
                            creditLoansByAccount[accountId] = [CreditLoan]()
                        }
                        
                        creditLoansByAccount[accountId]?.append(creditLoan)
                    }
                    
                    for creditLoan in creditLoansByAccount {
                        let account = self.getAccountById(id: creditLoan.key)
                        if var _account = account {
                            _account.setCreditLoans(creditLoans: creditLoan.value)
                        }
                    }
                    
                    let mortgages = liablities.getMortgages()
                    
                    var mortgagesByAccount = [String: [Mortgage]]()
                    
                    for mortgage in mortgages {
                        let accountId = mortgage.getAccountId()
                        let account = mortgagesByAccount[accountId]
                        
                        if (account == nil) {
                            mortgagesByAccount[accountId] = [Mortgage]()
                        }
                        
                        mortgagesByAccount[accountId]?.append(mortgage)
                    }
                    
                    for mortgage in mortgagesByAccount {
                        let account = self.getAccountById(id: mortgage.key)
                        if var _account = account {
                            _account.setMortgages(mortgages:mortgage.value)
                        }
                    }
                    
                    let studentLoans = liablities.getStudentLoans()
                    
                    var studentLoansByAccount = [String: [StudentLoan]]()
                    
                    for studentLoan in studentLoans {
                        let accountId = studentLoan.getAccountId()
                        let account = studentLoansByAccount[accountId]
                        
                        if (account == nil) {
                            studentLoansByAccount[accountId] = [StudentLoan]()
                        }
                        
                        studentLoansByAccount[accountId]?.append(studentLoan)
                    }
                    
                    for studentLoan in studentLoansByAccount {
                        let account = self.getAccountById(id: studentLoan.key)
                        if var _account = account {
                            _account.setStudentLoans(studentLoans:studentLoan.value)
                        }
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
        // Needs to test here if the call was succssful or not
        /*if (json != nil) {
            Globals.userHandler.setUserToken(userToken: json!["token"] as! String)
        }*/
    }
    
    func retrieveAccounts(dispatch : DispatchGroup?) {
        if (Globals.plaidMode) {
            NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetAccounts", token: Globals.userHandler.getUserToken(),  extraParams:nil, callback: self.getAccountsCallBack)
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetTransactions", token: globals.userHandler.getUserToken(),  extraParams:["startDate" : "2019-01-01", "endDate" : "2021-05-10", "account_ids": ["MeoKpvMlvlU3eQPzzz37Iry3r9xog3u94LwLl"]], callback: self.getTransactionsCallBack)*/
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetHoldings", token: globals.userHandler.getUserToken(),  extraParams:["account_ids": ["gekm4KVpKpUAX7pyyyABIpGWpyoLdWtgLEaEZ"]], callback: self.getHoldingsCallBack)*/
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetHoldings", token: globals.userHandler.getUserToken(),  extraParams:nil, callback: self.getHoldingsCallBack)*/
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetLiabilities", token: Globals.userHandler.getUserToken(),  extraParams:nil, callback: self.getLiabilitiesCallBack)*/
            
            /*NetworkHandler.sendPostRequest(dispatch: dispatch!, url: "GetLiabilities", token: globals.userHandler.getUserToken(),  extraParams:["account_ids": ["gekm4KVpKpUAX7pyyyABIpGWpyoLdWtgLEaEZ"]], callback: self.getHoldingsCallBack)*/
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
    
    func setLinkToken(token : String) {
        self.m_linkToken = token;
    }
    
    
}
