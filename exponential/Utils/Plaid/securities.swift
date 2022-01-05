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
            self.securities[security.getId()] = security
        }
    }
    
    init(_ json : [String: Any]?) {
        self.securities = [String:Security]()
        
        if let data = json {
            let securities = data["securities"]! as? [Any] ?? []
            for security in securities {
                let _security = Security(security as! NSDictionary)
                self.securities[_security.getId()] = _security
            }
        }
    }
    
    subscript (_ id : String) -> Security? {securities[id]}
    
    private var securities = [String:Security]()
    
}
