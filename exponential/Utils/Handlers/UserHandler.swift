//
//  UserHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class UserHandler {
    
    public static func login(dispatch : DispatchGroup) {
      /*  let url = URL(string: Globals.getServerAddr() + "/login")!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // ensure there is no error for this HTTP response
            if error == nil {
                // ensure there is data returned from this HTTP response
                let content = data
                
                if content != nil {
                    guard let json = (try? JSONSerialization.jsonObject(with: content!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                        print("Not containing JSON")
                        dispatch.leave()
                        return
                    }
                    
                    let accessToken = json["accessToken"] as String?
                }
            }
            
            dispatch.leave()
        }
        
        task.resume()*/
    }
}

