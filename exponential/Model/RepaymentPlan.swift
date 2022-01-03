//
//  RepaymentPlan.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct RepaymentPlan : Codable{
    
    init() {
        description = ""
        type = ""
    }
    
    init(_ repaymentPlanInfo : NSDictionary) {
        
        description = repaymentPlanInfo["description"] as? String
        type = repaymentPlanInfo["type"] as? String
    }
    
    public func getType() -> String {OptUtils.unwrap(type)}
    public func m_getDescription() -> String {OptUtils.unwrap(description)}
    
    private var description : String?
    private var type : String?
}
