//
//  Address.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Address : Codable{
    
    init() {
        city = ""
        street = ""
        country = ""
        postal_code = ""
        region = ""
    }
    
    init(_ addressInfo: NSDictionary) {
        city = addressInfo["city"] as? String
        street = addressInfo["street"] as? String
        country = addressInfo["country"] as? String
        postal_code = addressInfo["postal_code"] as? String
        region = addressInfo["region"] as? String
    }
    
    public func getCity() -> String {
        return OptUtils.unwrap(city)
    }
    
    public func getStreet() -> String {
        return OptUtils.unwrap(street)
    }
    
    public func getCountry() -> String {
        return OptUtils.unwrap(country)
    }
    
    public func getPostalCode() -> String {
        return OptUtils.unwrap(postal_code)
    }
    
    public func getRegion() -> String {
        return OptUtils.unwrap(region)
    }
    
    private var city : String?
    private var street : String?
    private var country : String?
    private var postal_code : String?
    private var region : String?
    
}
