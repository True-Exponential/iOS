//
//  RepaymentPlan.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct RepaymentPlan {
    
    private var m_description : String?
    private var m_type : String?
    
    init(repaymentPlanInfo : NSDictionary) {
        
        m_description = repaymentPlanInfo["description"] as? String
        m_type = repaymentPlanInfo["type"] as? String
    }
    
    public func getType() -> String {
        StrUtils.unwrapString(value: m_type)
    }
    
    public func m_getDescription() -> String {
        StrUtils.unwrapString(value: m_description)
    }
}
