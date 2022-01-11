//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    func getUserToken() -> String {
        if userToken.isEmpty {
            userToken = UserDefaults.standard.string(forKey: UserHandler.USER_TOKEN_KEY_NAME) ?? ""
        }
        
        return userToken
    }
    
    var isLoggedIn : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_SIGNED_IN)
        }
        set {
            UserDefaults.standard.set(1,forKey: UserHandler.USER_SIGNED_IN)
        }
    }
    
    var isRegistered : Bool {
        get {
            UserDefaults.standard.bool(forKey: UserHandler.USER_REGISTERED)
        }
        set {
            UserDefaults.standard.set(1,forKey: UserHandler.USER_REGISTERED)
        }
    }
    
    func setUserToken(_ token : String) {
        userToken = token        
        UserDefaults.standard.set(self.userToken, forKey: UserHandler.USER_TOKEN_KEY_NAME)
    }
    
    private func loginCallBack(_ json : [String: Any]?) {
        if let data = json {
            if let expoToken = data["exponentialToken"] as? String {
                self.setUserToken(expoToken)
                self.isLoggedIn = true
                UserDefaults.standard.set(1, forKey: UserHandler.USER_SIGNED_IN)
                
                Globals.plaidHandler.setLinkToken(data["plaidLinkToken"] as? String ?? "")
            }
            else {
                UserDefaults.standard.set(0, forKey: UserHandler.USER_SIGNED_IN)
            }
        }
    }
    
    private func signupCallBack(_ json : [String: Any]?) {
        isRegistered = true
    }
    
    func login(_ dispatch : DispatchGroup, _ email: String, _ password: String) {
        if(Globals.demoMode) {
            UserDefaults.standard.set(1,forKey: UserHandler.USER_SIGNED_IN)
            dispatch.leave()
        }
        else {
            NetworkHandler.sendPostRequest(dispatch, "login", ["email" : email,"password" : password, "token":nil], self.loginCallBack)
        }
        
    }
    
    func signup(_ dispatch : DispatchGroup, _ email: String, _ password: String) {
        NetworkHandler.sendPostRequest(dispatch, "signup",
                                             ["email" : email,"password" : password,"agreement_approve": "1","invite_token": nil],
                                             self.signupCallBack)
    }
    
    static private let USER_TOKEN_KEY_NAME = "UserToken"
    static private let USER_SIGNED_IN = "SignedIn"
    static private let USER_REGISTERED = "Registered"
    
    private var userToken : String = ""
}

/*func signup(_ email: String, _ password: String) async {
    await NetworkHandler.sendPostRequest("signup", nil,
                                         ["email" : email,"password" : password,"agreement_approve": "1","invite_token": nil],
                                         self.signupCallBack)
}*/

