//
//  LoanStatus.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct LoanStatus : Codable{
    
    init() {}
    
    init(_ loanStatusInfo : NSDictionary) {
        end_date = loanStatusInfo["end_date"] as? String
        type = loanStatusInfo["type"] as? String
    }
    
    func getType() -> String {OptUtils.unwrap(type)}
    func getEndDate() -> String {OptUtils.unwrap(end_date)}
    
    private var end_date : String?
    private var type : String?
}
