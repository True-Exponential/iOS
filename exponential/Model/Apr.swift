//
//  Apr.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Apr : Codable {
    
    init(_ aprInfo: NSDictionary) {
        
        apr_type = aprInfo["apr_type"] as? String
                
        apr_percentage = aprInfo["apr_percentage"] as? Double
        balance_subject_to_apr = aprInfo["balance_subject_to_apr"] as? Double
        interest_charge_amount = aprInfo["interest_charge_amount"] as? Double
    }
    
    func getAprType() -> String {OptUtils.unwrap(apr_type)}    
    func getAprPercentage() -> Double {OptUtils.unwrap(apr_percentage)}
    func getBalanceSubjectToApr() -> Double {OptUtils.unwrap(balance_subject_to_apr)}
    func getInterestChargeAmount() -> Double {OptUtils.unwrap(interest_charge_amount)}
    
    private var apr_type : String?
    
    private var apr_percentage : Double?
    private var balance_subject_to_apr: Double?
    private var interest_charge_amount: Double?
}
