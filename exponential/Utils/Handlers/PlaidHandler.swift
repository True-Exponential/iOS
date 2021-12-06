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
    
    let serverAddress = "http://localhost:8080"
    private var linkToken = ""
    private var accessToken = ""
    
    private var m_accounts: Array = [PlaidAccount]()
    private var m_transactions: Array = [Transaction]()
    
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
    
    func getDefaultReq(relUrl : String, token: String?) -> URLRequest? {
        let url = URL(string: serverAddress + "/" + relUrl)!
        
        let parameters = ["token": token != nil ? token : self.accessToken]
        
        var request = URLRequest(url: url)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch  {
            return nil;
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        return request;
    }
    
    func getLinkToken(dispatch : DispatchGroup) {
        let url = URL(string: serverAddress + "/plaidGetLinkToken")!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // ensure there is no error for this HTTP response
            if error == nil {
                // ensure there is data returned from this HTTP response
                let content = data
                
                if content != nil {
                    guard let json = (try? JSONSerialization.jsonObject(with: content!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                        print("Not containing JSON")
                        dispatch.leave()
                        return
                    }
                    
                    self.linkToken = json["token"] as! String
                }
            }
            
            dispatch.leave()
        }
        
        task.resume()
    }
    
    func getAccessToken(publicToken: String, dispatch : DispatchGroup) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let request = self.getDefaultReq(relUrl: "plaidpublictoken2accesstoken", token: publicToken)
        
        if (request == nil) {
            return;
        }
        
        let task = session.dataTask(with: request!) { data, response, error in
            
            // ensure there is no error for this HTTP response
            if error == nil {
                // ensure there is data returned from this HTTP response
                let content = data
                
                if content != nil {
                    guard let json = (try? JSONSerialization.jsonObject(with: content!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                        print("Not containing JSON")
                        dispatch.leave()
                        return
                    }
                    
                    self.accessToken = json["token"] as! String
                    self.retrieveAccounts(dispatch:dispatch)
                }
            }
        }
        
        task.resume()
    }
    
    func retrieveAccounts(dispatch : DispatchGroup?) {
        if (Globals.demoMode) {
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
        else {
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let request = self.getDefaultReq(relUrl: "GetAccounts", token: nil)
            //"GetTransactions"
            // GetAccounts
            
            if (request == nil) {
                return;
            }
            
            let task = session.dataTask(with: request!) { data, response, error in
                
                // ensure there is no error for this HTTP response
                if error == nil {
                    // ensure there is data returned from this HTTP response
                    let content = data
                    
                    if content != nil {
                        guard let json = (try? JSONSerialization.jsonObject(with: content!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                            print("Not containing JSON")
                            dispatch!.leave()
                            return
                        }
                        
                        let accounts = json["accounts"]! as? Array<Any>
                        
                        if (accounts != nil) {
                            for account in accounts! {
                                let pldAccount = PlaidAccount(account:account as! NSDictionary)
                                self.m_accounts.append(pldAccount)
                            }
                        }
                        
                        let transactions = json["transactions"]! as? Array<Any>
                        if (transactions != nil) {
                            for transaction in transactions! {
                                let pldTransaction = Transaction(transaction:transaction as! NSDictionary)
                                self.m_transactions.append(pldTransaction)
                            }
                        }
                    }
                }
                
                dispatch!.leave();
                
            }
            
            task.resume()
        }
    }
    
}
