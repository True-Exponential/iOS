//
//  location.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Location :  Codable {
    
    init(){}
        
    init(_ _location : NSDictionary? ) {
        guard let location = _location else {
            assert(false)
            return
        }
        
        address = location["address"] as? String
        city = location["city"] as? String
        country = location["country"] as? String
        lat = location["lat"] as? String
        lon = location["lon"] as? String
        postalCode = location["postalCode"] as? String
        region = location["region"] as? String
        storeNumber = location["storeNumber"] as? String
    }
    
    func getAddress() -> String {OptUtils.unwrap(address)}
    func getCity() -> String {OptUtils.unwrap(city)}
    func getCountry() -> String {OptUtils.unwrap(country)}
    func getLat() -> String {OptUtils.unwrap(lat)}
    func getLon() -> String {OptUtils.unwrap(lon)}
    func getPostalCode() -> String {OptUtils.unwrap(postalCode)}
    func getRegion() -> String {OptUtils.unwrap(region)}
    func getStoreNumber() -> String {OptUtils.unwrap(storeNumber)}
        
    private var address  : String?
    private var city : String?
    private var country : String?
    private var lat : String?
    private var lon : String?
    private var postalCode : String?
    private var region : String?
    private var storeNumber : String?

}
