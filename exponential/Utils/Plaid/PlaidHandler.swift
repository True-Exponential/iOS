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

class PlaidHandler : Finance {
        
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
    
    func loadAccounts(dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "GetAccounts", token: Globals.userHandler.getUserToken(),  extraParams:nil, callback: self.loadAccountsCallBack)
    }
    
    private func loadAccountsCallBack(json : [String: Any]?) {
        Globals.accounts = Accounts(json: json)
    }
    
    func loadTransactions(dispatch : DispatchGroup, accountIds: [String]?) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "GetTransactions", token: Globals.userHandler.getUserToken(),  extraParams:["startDate" : "2019-01-01", "endDate" : "2021-05-10", "account_ids": accountIds ], callback: self.loadTransactionsCallBack)
    }
    
    private func loadTransactionsCallBack(json : [String: Any]?) {
        Globals.transactions = Transactions(json: json)
    }

    
    func loadCategories(dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "GetCategories", token: Globals.userHandler.getUserToken(),  extraParams:nil, callback: self.loadCategoriesCallBack)
    }
    
    private func loadCategoriesCallBack(json : [String: Any]?) {
        Globals.categories = Categories(json: json)
    }
    
    
    public func loadHoldings(dispatch : DispatchGroup, accountIds: [String]?) {
        var extraParams : [String: Any]? = nil
        
        if let _accountIds = accountIds {
            extraParams = ["account_ids": _accountIds]
        }
        
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "GetHoldings", token: Globals.userHandler.getUserToken(),  extraParams:extraParams, callback: self.loadHoldingsCallBack)
    }
        
    private func loadHoldingsCallBack(json : [String: Any]?) {
        Globals.holdings = Holdings(json: json)
    }
    
    public func loadLiabilities(dispatch : DispatchGroup, accountIds: [String]?) {
        var extraParams : [String: Any]? = nil
        
        if let _accountIds = accountIds {
            extraParams = ["account_ids": _accountIds]
        }
        
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "GetLiabilities", token: Globals.userHandler.getUserToken(),  extraParams:extraParams, callback: self.loadLiabilitiesCallBack)
    }
        
    private func loadLiabilitiesCallBack(json : [String: Any]?) {
        Globals.liablities = Liablities(json: json)
    }
    
    private func getAccessTokenCallBack(json : [String: Any]?) {
        // Needs to test here if the call was succssful or not
        /*if (json != nil) {
         Globals.userHandler.setUserToken(userToken: json!["token"] as! String)
         }*/
    }
    
    func getLinkToken() -> String {
        return self.m_linkToken
    }
    
    func setLinkToken(token : String) {
        self.m_linkToken = token;
    }
    
    private var m_linkToken = ""
}

