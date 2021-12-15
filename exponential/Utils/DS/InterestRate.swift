//
//  InterestRate.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct InterestRate {
    
    private var m_percentage : Double?
    private var m_type : String?
    
    init(interestRate: NSDictionary) {
        m_percentage = interestRate["percentage"] as? Double
        m_type = interestRate["type"] as? String
    }
    
    public func getType() -> String {
        StrUtils.unwrapString(value: m_type)
    }
    
    public func getStreet() -> Double {
        NumUtils.unwrapDouble(value: m_percentage)
    }
    
}
