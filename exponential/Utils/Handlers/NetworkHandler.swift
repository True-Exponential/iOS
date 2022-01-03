//
//  NetworkHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    static public func defaultCallback(response: [String: Any]?) {}
    
    static public func getDefaultReq(_ relUrl : String, _ token: String?, _ extraParams: [String:Any]?) -> URLRequest? {
        let url = URL(string: Globals.getServerAddr() + "/" + relUrl)!
        
        var parameters = [String : Any]()
        if let _token = token {
            parameters = ["token": _token as String]
        }
        
        if let _extraParams = extraParams {
            for param in _extraParams {
                parameters[param.key] = param.value
            }
        }
        
        var request = URLRequest(url: url)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch  {
            return nil
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        return request
    }
    
    static public func sendPostRequest(_ dispatch : DispatchGroup,_ url: String, _ token: String?,_ extraParams: [String:Any]?,
     _ callback: @escaping (_ response : [String: Any]?) ->Void) {

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        if let request = NetworkHandler.getDefaultReq(url, token,extraParams) {
            let task = session.dataTask(with: request) { data, response, error in
                
                // ensure there is no error for this HTTP response
                if error == nil {
                    // ensure there is data returned from this HTTP response
                    if let content = data {
                        guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
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
        else {
            dispatch.leave()
        }
    }
    
    static public func sendGetRequest(_ dispatch : DispatchGroup,_  url: String,_  callback: @escaping (_ response : [String: Any]?) ->Void) {
        let url = URL(string: Globals.getServerAddr() + "/" + url)!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error == nil {
                // ensure there is data returned from this HTTP response
                
                if let content = data {
                    guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
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
