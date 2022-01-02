//
//  LoanStatus.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct LoanStatus : Codable{
    
    init(loanStatusInfo : NSDictionary) {
        
        end_date = loanStatusInfo["end_date"] as? String
        type = loanStatusInfo["type"] as? String
    }
    
    public func getType() -> String {
        OptUtils.unwrap(type)
    }
    
    public func getEndDate() -> String {
        OptUtils.unwrap(end_date)
    }
    
    private var end_date : String?
    private var type : String?
}
