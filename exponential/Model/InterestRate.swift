//
//  InterestRate.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct InterestRate : Codable {
    
    init() {
        percentage = 0
        type = ""
    }
    
    init(_ interestRate: NSDictionary) {
        percentage = interestRate["percentage"] as? Double
        type = interestRate["type"] as? String
    }
    
    public func getType() -> String {OptUtils.unwrap(type)}
    public func getStreet() -> Double {OptUtils.unwrap(percentage)}
    
    private var percentage : Double?
    private var type : String?
    
}
