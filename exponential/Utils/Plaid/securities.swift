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
        self.securities = securities
    }
    
    init(_ json : [String: Any]?) {
        self.securities = [Security]()
        
        if let data = json {
            let securities = data["securities"]! as? [Any] ?? []
            for secutiry in securities {
                let secutiry = Security(secutiry as! NSDictionary)
                self.securities.append(secutiry)
            }
        }
    }
    
    public func get(_ id : String) -> Security? {
        for security in securities {
            if security.getId() == id {
                return security
            }
        }
        
        return nil
    }
    
    private var securities = [Security]()
    
}
