//
//  Address.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Address {
    
    private var m_city : String?
    private var m_street : String?
    private var m_country : String?
    private var m_postalCode : String?
    private var m_region : String?
    
    init(addressInfo: NSDictionary) {
        m_city = addressInfo["city"] as? String
        m_street = addressInfo["street"] as? String
        m_country = addressInfo["country"] as? String
        m_postalCode = addressInfo["postal_code"] as? String
        m_region = addressInfo["region"] as? String
    }
    
    public func getCity() -> String {
        StrUtils.unwrapString(value: m_city)
    }
    
    public func getStreet() -> String {
        StrUtils.unwrapString(value: m_street)
    }
    
    public func getCountry() -> String {
        StrUtils.unwrapString(value: m_country)
    }
    
    public func getPostalCode() -> String {
        StrUtils.unwrapString(value: m_postalCode)
    }
    
    public func getRegion() -> String {
        StrUtils.unwrapString(value: m_region)
    }
}
