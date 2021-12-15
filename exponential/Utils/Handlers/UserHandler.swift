//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    static private let USER_TOKEN_KEY_NAME = "UserToken"
    
    private var m_userToken : String = ""
    
    public func getUserToken() -> String {
        if (self.m_userToken.count > 0) {
            return self.m_userToken
        }
        else {
            let defaults = UserDefaults.standard
            
            let storedAccessToken = defaults.string(forKey: UserHandler.USER_TOKEN_KEY_NAME)
            if let userToken = storedAccessToken {
                self.m_userToken = userToken
            }
        }
        
        return self.m_userToken
    }
    
    public func setUserToken(token : String) {
        self.m_userToken = token;
        
        let defaults = UserDefaults.standard
        defaults.set(self.m_userToken, forKey: UserHandler.USER_TOKEN_KEY_NAME)
    }
    
    private func loginCallBack(json : [String: Any]?) {
        if (json != nil) {
            let userToken = json!["exponentialToken"] as? String?
            if let _userToken = userToken {
                self.setUserToken(token:_userToken!)
                
                let shouldLoginToPlaid = json!["shouldLoginToPlaid"] as! Bool
                if (shouldLoginToPlaid) {
                    let linkToken = json!["plaidLinkToken"] as? String?
                    if let linkToken = linkToken {
                        Globals.plaidHandler.setLinkToken(token: linkToken!)
                    }
                }
            }
        }
    }
    
    public func login(dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "login", token: self.getUserToken(),
                                       extraParams: nil, callback: self.loginCallBack)
    }
}

