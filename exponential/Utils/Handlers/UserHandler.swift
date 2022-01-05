//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    public func getUserToken() -> String {
        if userToken.isEmpty {
            userToken = UserDefaults.standard.string(forKey: UserHandler.USER_TOKEN_KEY_NAME) ?? ""
        }
        
        return userToken
    }
    
    public var isLoggedIn : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_SIGNED_IN)
        }
        set {
            UserDefaults.standard.set(1,forKey: UserHandler.USER_SIGNED_IN)
        }
    }
    
    public var isRegistered : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_REGISTERED)
        }
        set {
            UserDefaults.standard.set(1,forKey: UserHandler.USER_REGISTERED)
        }
    }

    
    public func setUserToken(_ token : String) {
        userToken = token
        
        UserDefaults.standard.set(self.userToken, forKey: UserHandler.USER_TOKEN_KEY_NAME)
    }
    
    private func loginCallBack(_ json : [String: Any]?) {
        if let data = json {
            if let expoToken = data["exponentialToken"] as? String {
                self.setUserToken(expoToken)
                self.isLoggedIn = true
                UserDefaults.standard.set(1, forKey: UserHandler.USER_SIGNED_IN)
                
                if let linkToken = data["plaidLinkToken"] as? String {
                //if let _ = data["shouldLoginToPlaid"] as? Bool, let linkToken = data["plaidLinkToken"] as? String {
                    Globals.plaidHandler.setLinkToken(linkToken)
                }
            }
            else {
                UserDefaults.standard.set(0, forKey: UserHandler.USER_SIGNED_IN)
            }
        }
    }
    
    private func signupCallBack(_ json : [String: Any]?) {
        isRegistered = true
    }
    
    public func login(_ dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch, "login", nil,["email" : "omer.paran@true-exp.com","password" : "qazwsx11", "token":nil], self.loginCallBack)
    }
    
    public func signup(_ dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch, "signup", nil,
    ["email" : "omer.paran@true-exp.com","password" : "qazwsx11","agreement_approve": "1","invite_token": nil],
                                       self.signupCallBack)
    }
    
    static private let USER_TOKEN_KEY_NAME = "UserToken"
    static private let USER_SIGNED_IN = "SignedIn"
    static private let USER_REGISTERED = "Registered"
    
    private var userToken : String = ""
}

