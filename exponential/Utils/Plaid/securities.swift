//
//  securities.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Securities {
    
    init() {}
    
    init(_ securities : [Security]) {
        for security in securities {
            self[security.getId()] = security
        }
    }
    
    init(_ json : [String: Any]?) {
        self.securities = [String:Security]()
        
        if let data = json {
            let securities = data["securities"]! as? [Any] ?? []
            for _security in securities {
                if let security = _security as? NSDictionary {
                    let newSecurity = Security(security)
                    self[newSecurity.getId()] = newSecurity
                }
            }
        }
    }
    
    subscript (_ id : String) -> Security? {
        get {
            securities[id]
        }
        
        set {
            securities[id] = newValue
        }
    }
    
    private var securities = [String:Security]()
    
}
