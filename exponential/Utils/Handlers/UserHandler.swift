//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation
import SwiftUI

class UserHandler {
    
    var userToken : String {
        get {
            UserDefaults.standard.string(forKey: UserHandler.USER_TOKEN_KEY_NAME) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserHandler.USER_TOKEN_KEY_NAME)
        }
    }
    
    var isLoggedIn : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_SIGNED_IN)
        }
        set {
            UserDefaults.standard.set(newValue,forKey: UserHandler.USER_SIGNED_IN)
        }
    }
    
    var isRegistered : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_REGISTERED)
        }
        set {
            UserDefaults.standard.set(newValue,forKey: UserHandler.USER_REGISTERED)
        }
    }
    
    private func loginCallBack(_ json : [String: Any]?) {
        if let data = json {
            if let expoToken = data["exponentialToken"] as? String {
                userToken = expoToken
                self.isLoggedIn = true
                
                Globals.plaidHandler.setLinkToken(data["plaidLinkToken"] as? String ?? "")
            }
            else {
                self.isLoggedIn = false
            }
        }
        else {
            self.isLoggedIn = false
        }
    }
    
    private func signupCallBack(_ json : [String: Any]?) {
        if let data = json {
            if let expoToken = data["exponentialToken"] as? String {
                userToken = expoToken
                
                self.isRegistered = true
                
                let plaidLinkToken = data["plaidLinkToken"] as? String ?? ""
                self.isLoggedIn = !plaidLinkToken.isEmpty
                Globals.plaidHandler.setLinkToken(plaidLinkToken)
            }
            else {
                self.isLoggedIn = false
            }
        }
        else {
            self.isRegistered = false
            self.isLoggedIn = false
        }
    }
    
    func login(_ dispatch : DispatchGroup, _ email: String, _ password: String) {
        if(Globals.demoMode) {
            self.isLoggedIn = true
            dispatch.leave()
        }
        else {
            NetworkHandler.sendPostRequest(dispatch, "login", ["email" : email,"password" : password, "token":nil], self.loginCallBack)
        }        
    }
    
    func signup(_ dispatch : DispatchGroup, _ email: String, _ password: String, _ firstName: String, _ lastName: String) {
        if(Globals.demoMode) {
            self.isLoggedIn = true
            dispatch.leave()
        }
        else {
            NetworkHandler.sendPostRequest(dispatch, "signup",
                                                 ["email" : email,"password" : password,
                                                  "agreement_approve": "1","invite_token": nil],
                                                 self.signupCallBack)
        }
    }
    
    static private let USER_TOKEN_KEY_NAME = "UserToken"
    static private let USER_SIGNED_IN = "SignedIn"
    static private let USER_REGISTERED = "Registered"
}

/*func signup(_ email: String, _ password: String) async {
    await NetworkHandler.sendPostRequest("signup", nil,
                                         ["email" : email,"password" : password,"agreement_approve": "1","invite_token": nil],
                                         self.signupCallBack)
}*/

