//
//  Address.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Address : Codable{
    
    init(addressInfo: NSDictionary) {
        city = addressInfo["city"] as? String
        street = addressInfo["street"] as? String
        country = addressInfo["country"] as? String
        postal_code = addressInfo["postal_code"] as? String
        region = addressInfo["region"] as? String
    }
    
    public func getCity() -> String {
        StrUtils.unwrapString(value: city)
    }
    
    public func getStreet() -> String {
        StrUtils.unwrapString(value: street)
    }
    
    public func getCountry() -> String {
        StrUtils.unwrapString(value: country)
    }
    
    public func getPostalCode() -> String {
        StrUtils.unwrapString(value: postal_code)
    }
    
    public func getRegion() -> String {
        StrUtils.unwrapString(value: region)
    }
    
    private var city : String?
    private var street : String?
    private var country : String?
    private var postal_code : String?
    private var region : String?
    
}
