//
//  NetworkHandler.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    static public func defaultCallback(response: [String: Any]?) {}
    
    static public func getDefaultReq(relUrl : String, token: String?, extraParams: [String:String]?) -> URLRequest? {
        let url = URL(string: Globals.getServerAddr() + "/" + relUrl)!
        
        var parameters = [String : Any]()
        if (token != nil) {
            parameters = ["token": token! as String]
        }
        
        if (extraParams != nil) {
            for param in extraParams! {
                parameters[param.key] = param.value
            }
        }
        
        var request = URLRequest(url: url)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch  {
            return nil;
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        return request;
    }
    
    static public func sendPostRequest(dispatch : DispatchGroup,url: String, token: String?,extraParams: [String:String]?,
     callback: @escaping (_ response : [String: Any]?) ->Void) {

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let request = NetworkHandler.getDefaultReq(relUrl: url, token: token,extraParams:extraParams)
        
        if (request != nil) {
            let task = session.dataTask(with: request!) { data, response, error in
                
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
                        
                        callback(json);
                    }
                }
                
                dispatch.leave()
            }
            
            task.resume()
        }
        else {
            dispatch.leave()
        }
    }
    
    static public func sendGetRequest(dispatch : DispatchGroup, url: String, callback: @escaping (_ response : [String: Any]?) ->Void) {
        let url = URL(string: Globals.getServerAddr() + "/" + url)!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error == nil {
                // ensure there is data returned from this HTTP response
                let content = data
                
                if content != nil {
                    guard let json = (try? JSONSerialization.jsonObject(with: content!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                        print("Not containing JSON")
                        dispatch.leave()
                        return
                    }
                    
                    callback(json)
                }
            }
            
            dispatch.leave()
        }
        
        task.resume()
    }
    
}
