//
//  securities.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Securities {
    
    init() {}
    
    init(securities : [Security]) {
        self.securities = securities
    }
    
    init(json : [String: Any]?) {
    
        self.securities = [Security]()
        
        let securities = json!["securities"]! as? Array<Any>
        if (securities != nil) {
            
            for secutiry in securities! {
                let secutiry = Security(security:secutiry as! NSDictionary)
                self.securities.append(secutiry)
            }
        }
    }
    
    public func get(id : String) -> Security? {
        for security in securities {
            if (security.getId() == id) {
                return security
            }
        }
        
        return nil
    }
    
    private var securities: Array = [Security]()
    
}
