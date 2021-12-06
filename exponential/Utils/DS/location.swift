//
//  location.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Location {
    
    private var m_address  : String?
    private var m_city : String?
    private var m_country : String?
    private var m_lat : String?
    private var m_lon : String?
    private var m_postalCode : String?
    private var m_region : String?
    private var m_storeNumber : String?
    
    init(location : NSDictionary ) {
        m_address = location["address"] as? String
        m_city = location["city"] as? String
        m_country = location["country"] as? String
        m_lat = location["lat"] as? String
        m_lon = location["lon"] as? String
        m_postalCode = location["postalCode"] as? String
        m_region = location["region"] as? String
        m_storeNumber = location["storeNumber"] as? String
    }
    
    public func getAddress() -> String {
        return StrUtils.unwrapString(value:m_address);
    }
    
    public func getCity() -> String {
        return StrUtils.unwrapString(value:m_city);
    }
    
    public func getCountry() -> String {
        return StrUtils.unwrapString(value:m_country);
    }
    
    public func getLat() -> String {
        return StrUtils.unwrapString(value:m_lat);
    }
    
    public func getLon() -> String {
        return StrUtils.unwrapString(value:m_lon);
    }
    
    public func getPostalCode() -> String {
        return StrUtils.unwrapString(value:m_postalCode);
    }
    
    public func getRegion() -> String {
        return StrUtils.unwrapString(value:m_region);
    }
    
    public func getStoreNumber() -> String {
        return StrUtils.unwrapString(value:m_storeNumber);
    }
}
