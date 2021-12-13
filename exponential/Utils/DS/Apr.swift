//
//  Apr.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Apr {
    private var m_aprType : String?
    
    private var m_aprPercentage : Double?
    private var m_balanceSubjectToApr: Double?
    private var m_interestChargeAmount: Double?
    
    init(aprInfo: NSDictionary) {
        
        m_aprType = aprInfo["apr_type"] as? String
                
        m_aprPercentage = aprInfo["apr_percentage"] as? Double
        m_balanceSubjectToApr = aprInfo["balance_subject_to_apr"] as? Double
        m_interestChargeAmount = aprInfo["interest_charge_amount"] as? Double
    }
    
    public func getAprType() -> String {
        return StrUtils.unwrapString(value: m_aprType)
    }
    
    public func getAprPercentage() -> Double {
        return NumUtils.unwrapDouble(value: m_aprPercentage)
    }
    
    public func getBalanceSubjectToApr() -> Double {
        return NumUtils.unwrapDouble(value: m_balanceSubjectToApr)
    }
    
    public func getInterestChargeAmount() -> Double {
        return NumUtils.unwrapDouble(value: m_interestChargeAmount)
    }
}
