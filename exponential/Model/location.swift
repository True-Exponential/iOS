//
//  location.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Location :  Codable {
        
    init(location : NSDictionary ) {
        address = location["address"] as? String
        city = location["city"] as? String
        country = location["country"] as? String
        lat = location["lat"] as? String
        lon = location["lon"] as? String
        postalCode = location["postalCode"] as? String
        region = location["region"] as? String
        storeNumber = location["storeNumber"] as? String
    }
    
    public func getAddress() -> String {
        return OptUtils.unwrap(address)
    }
    
    public func getCity() -> String {
        return OptUtils.unwrap(city)
    }
    
    public func getCountry() -> String {
        return OptUtils.unwrap(country)
    }
    
    public func getLat() -> String {
        return OptUtils.unwrap(lat)
    }
    
    public func getLon() -> String {
        return OptUtils.unwrap(lon)
    }
    
    public func getPostalCode() -> String {
        return OptUtils.unwrap(postalCode)
    }
    
    public func getRegion() -> String {
        return OptUtils.unwrap(region)
    }
    
    public func getStoreNumber() -> String {
        return OptUtils.unwrap(storeNumber)
    }
    
    private var address  : String?
    private var city : String?
    private var country : String?
    private var lat : String?
    private var lon : String?
    private var postalCode : String?
    private var region : String?
    private var storeNumber : String?

}
