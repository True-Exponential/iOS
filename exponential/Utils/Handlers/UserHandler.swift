//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    static private let USER_TOKEN_KEY_NAME = "UserToken"
    
    private var m_userToken : String = ""
    
    public func getUserToken() -> String {
        if self.m_userToken.count > 0 {
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
    
    public func setUserToken(_ token : String) {
        self.m_userToken = token
        
        let defaults = UserDefaults.standard
        defaults.set(self.m_userToken, forKey: UserHandler.USER_TOKEN_KEY_NAME)
    }
    
    private func loginCallBack(_ json : [String: Any]?) {
        if let data = json {
            let userToken = data["exponentialToken"] as? String?
            if let _userToken = userToken {
                self.setUserToken(_userToken!)
                
                let shouldLoginToPlaid = data["shouldLoginToPlaid"] as! Bool
                if shouldLoginToPlaid {
                    let linkToken = data["plaidLinkToken"] as? String?
                    if let linkToken = linkToken {
                        Globals.plaidHandler.setLinkToken(linkToken!)
                    }
                }
            }
        }
    }
    
    public func login(_ dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch, "login", self.getUserToken(),nil, self.loginCallBack)
    }
}

