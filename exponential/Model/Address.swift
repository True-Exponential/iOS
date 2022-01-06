//
//  Address.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Address : Codable{
    
    init() {}
    
    init(_ addressInfo: NSDictionary) {
        city = addressInfo["city"] as? String
        street = addressInfo["street"] as? String
        country = addressInfo["country"] as? String
        postal_code = addressInfo["postal_code"] as? String
        region = addressInfo["region"] as? String
    }
    
    public func getCity() -> String {OptUtils.unwrap(city)}
    public func getStreet() -> String {OptUtils.unwrap(street)}
    public func getCountry() -> String {OptUtils.unwrap(country)}
    public func getPostalCode() -> String {OptUtils.unwrap(postal_code)}
    public func getRegion() -> String {OptUtils.unwrap(region)}
    
    private var city : String?
    private var street : String?
    private var country : String?
    private var postal_code : String?
    private var region : String?
    
}
