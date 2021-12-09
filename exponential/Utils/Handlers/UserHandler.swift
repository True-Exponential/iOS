//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    private func loginCallBack(json : [String: Any]?) {
        if (json != nil) {
            let isAccessToken = json!["isAccessToken"] as! Bool
            let plaidToken = json!["plaidToken"] as! String
            if (isAccessToken) {
                Globals.plaidHandler.setAccessToken(accessToken: plaidToken)
            }
            else {
                Globals.plaidHandler.setAccessToken(accessToken: "")
                Globals.plaidHandler.setLinkToken(linkToken: plaidToken)
            }
        }
    }
    
    public func login(dispatch : DispatchGroup) {
        NetworkHandler.sendPostRequest(dispatch: dispatch, url: "login", token: Globals.plaidHandler.getCurrAccessToken(), extraParams: nil, callback: self.loginCallBack)
    }
}

