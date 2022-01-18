//
//  NetworkHandler.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 08/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct NetworkHandler {
    
    static func getDefaultReq(_ relUrl : String,  _ parameters: [String:Any]) -> URLRequest? {
        if let url = URL(string: Globals.getServerAddr() + "/" + relUrl) {
            
            var request = URLRequest(url: url)
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch  {
                return nil
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            if (!Globals.userHandler.userToken.isEmpty) {
                request.addValue("Bearer " + Globals.userHandler.userToken, forHTTPHeaderField: "Authorization")
            }
            
            request.httpMethod = "POST"
            
            return request
        }
        
        return nil
    }
    
    static func sendPostRequest(_ dispatch : DispatchGroup,_ url: String, _ extraParams: [String:Any],
     _ callback: @escaping (_ response : [String: Any]?) ->Void) {

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 120.0
        config.timeoutIntervalForResource = 120.0
        
        let session = URLSession(configuration: config)

        if let request = NetworkHandler.getDefaultReq(url, extraParams) {
            
            session.dataTask(with: request) { data, response, error in
                
                // ensure there is no error for this HTTP response
                if error == nil {
                    // ensure there is data returned from this HTTP response
                    if let content = data {
                        guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any]
                        else {
                            print("Not containing JSON")
                            callback(nil)
                            dispatch.leave()
                            return
                        }
                        
                        callback(json)
                    }
                }
                else {
                    callback(nil)
                }
                
                dispatch.leave()
            }.resume()
        }
        else {
            dispatch.leave()
        }
    }
    
    static func sendGetRequest(_ dispatch : DispatchGroup,_  url: String,_  callback: @escaping (_ response : [String: Any]?) ->Void) {
        let url = URL(string: Globals.getServerAddr() + "/" + url)!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { data, response, error in
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
        }.resume()
    }
    
    static func sendPostRequest(_ url: String, _ extraParams: [String:Any],
     _ callback: @escaping (_ response : [String: Any]?) ->Void) async {
        
        if let request = NetworkHandler.getDefaultReq(url, extraParams) {
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                guard let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any]
                else {
                    print("Not containing JSON")
                    callback(nil)
                    return
                }
                
                callback(json)
            }
            catch{
                print("Error in post call")
                callback(nil)
            }
        }
    }
    
}
