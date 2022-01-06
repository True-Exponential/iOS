//
//  PlaidHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 28/11/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import SwiftUI
import Foundation
import LinkKit

class PlaidHandler : Finance {
        
    func getLinkToken(_ dispatch : DispatchGroup) {
        NetworkHandler.sendGetRequest(dispatch, "plaidGetLinkToken", self.getLinkTokenCallBack)
    }
    
    func getAccessToken(_ publicToken: String,_  dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch, "plaidpublictoken2accesstoken",Globals.userHandler.getUserToken(),
                                       ["plaidPublicToken":publicToken], self.getAccessTokenCallBack)
    }
    
    private func getLinkTokenCallBack(_ json : [String: Any]?) {
        if let data = json {
            self.setLinkToken(data["token"] as? String)
        }
    }
    
    func loadAccounts(_ dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch,"GetAccounts", Globals.userHandler.getUserToken(),  nil, self.loadAccountsCallBack)
    }
    
    private func loadAccountsCallBack(_ json : [String: Any]?) {
        Globals.accounts = Accounts(json)
    }
    
    func loadTransactions(_ dispatch : DispatchGroup,_  accountIds: [String]?) {
        NetworkHandler.sendPostRequest(dispatch, "GetTransactions",  Globals.userHandler.getUserToken(),  ["startDate" : "2019-01-01", "endDate" : "2021-05-10", "account_ids": accountIds ],  self.loadTransactionsCallBack)
    }
    
    private func loadTransactionsCallBack(_ json : [String: Any]?) {
        Globals.transactions = Transactions(json)
    }

    
    func loadCategories(_ dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch, "GetCategories",  Globals.userHandler.getUserToken(),  nil, self.loadCategoriesCallBack)
    }
    
    private func loadCategoriesCallBack(_ json : [String: Any]?) {
        Globals.categories = Categories(json)
    }
    
    
    public func loadHoldings(_ dispatch : DispatchGroup,_  accountIds: [String]?) {
        var extraParams : [String: Any]? = nil
        
        if let _accountIds = accountIds {
            extraParams = ["account_ids": _accountIds]
        }
        
        NetworkHandler.sendPostRequest(dispatch, "GetHoldings", Globals.userHandler.getUserToken(),  extraParams, self.loadHoldingsCallBack)
    }
        
    private func loadHoldingsCallBack(json : [String: Any]?) {
        Globals.holdings = Holdings(json) ?? Holdings()
    }
    
    public func loadLiabilities(_ dispatch : DispatchGroup,_  accountIds: [String]?) {
        var extraParams : [String: Any]? = nil
        
        if let _accountIds = accountIds {
            extraParams = ["account_ids": _accountIds]
        }
        
        NetworkHandler.sendPostRequest(dispatch, "GetLiabilities", Globals.userHandler.getUserToken(),  extraParams, self.loadLiabilitiesCallBack)
    }
        
    private func loadLiabilitiesCallBack(_ json : [String: Any]?) {
        Globals.liablities = Liablities(json)
    }
    
    private func getAccessTokenCallBack(_ json : [String: Any]?) {
        // Needs to test here if the call was succssful or not
        /*if json != nil {
         Globals.userHandler.setUserToken(userToken: json!["token"] as String)
         }*/
    }
    
    func getLinkToken() -> String {linkToken}
    
    func setLinkToken(_ token : String?) {linkToken = token ?? ""}
    
    private var linkToken = ""
}

