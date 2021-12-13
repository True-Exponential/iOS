//
//  PslfStatus.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct PslfStatus {
    
    private var m_estimatedEligibilityDate : String?
    private var m_paymentsMade : Double?
    private var m_paymentsRemaining : Double?
    
    init(pslfStatusInfo : NSDictionary) {
        
        m_estimatedEligibilityDate = pslfStatusInfo["estimated_eligibility_date"] as? String
        
        m_paymentsMade = pslfStatusInfo["payments_made"] as? Double
        m_paymentsRemaining = pslfStatusInfo["payments_remaining"] as? Double
    }
    
    public func getEstimatedEligibilityDate() -> String {
        StrUtils.unwrapString(value: m_estimatedEligibilityDate)
    }
    
    public func getPaymentsMade() -> Double {
        NumUtils.unwrapDouble(value: m_paymentsMade)
    }
    
    public func getPaymentsRemaining() -> Double {
        NumUtils.unwrapDouble(value: m_paymentsRemaining)
    }
    
}
