//
//  PslfStatus.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PslfStatus : Codable {
    
    init() {}
    
    init(_ pslfStatusInfo : NSDictionary) {
        
        estimated_eligibility_date = pslfStatusInfo["estimated_eligibility_date"] as? String
        
        payments_made = pslfStatusInfo["payments_made"] as? Double
        payments_remaining = pslfStatusInfo["payments_remaining"] as? Double
    }
    
    public func getEstimatedEligibilityDate() -> String {OptUtils.unwrap(estimated_eligibility_date)}
    public func getPaymentsMade() -> Double {OptUtils.unwrap(payments_made)}
    public func getPaymentsRemaining() -> Double {OptUtils.unwrap(payments_remaining)}
    
    private var estimated_eligibility_date : String?
    private var payments_made : Double?
    private var payments_remaining : Double?
    
}
