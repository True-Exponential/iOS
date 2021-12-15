//
//  LoanStatus.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct LoanStatus {
    
    private var m_endDate : String?
    private var m_type : String?
    
    init(loanStatusInfo : NSDictionary) {
        
        m_endDate = loanStatusInfo["end_date"] as? String
        m_type = loanStatusInfo["type"] as? String
    }
    
    public func getType() -> String {
        StrUtils.unwrapString(value: m_type)
    }
    
    public func getEndDate() -> String {
        StrUtils.unwrapString(value: m_endDate)
    }
}
