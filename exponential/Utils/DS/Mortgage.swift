//
//  MortgageLiability.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Mortgage {
    
    private var m_accountId : String?
    private var m_accountNumber : String?
    private var m_lastPaymentDate : String?
    private var m_loanTerm : String?
    private var m_loanTypeDescription : String?
    private var m_maturityDate : String?
    private var m_nextPaymentDueDate : String?
    private var m_originationDate : String?
    
    private var m_currentLateFee : Double?
    private var m_escrowBalance : Double?
    private var m_lastPaymentAmount : Double?
    private var m_nextMonthlyPayment : Double?
    private var m_originationPrincipalAmount : Double?
    private var m_pastDueAmount : Double?
    private var m_ytdInterestPaid : Double?
    private var m_ytdPrincipalPaid : Double?
    
    private var m_hasPmi : Bool?
    private var m_hasPrepaymentPenalty : Bool?
    
    private var m_propertyAddress : Address?
    private var m_interestRate : InterestRate?
    
    init(mortgageInfo: NSDictionary) {
        m_accountId = mortgageInfo["account_id"] as? String
        
        m_accountNumber = mortgageInfo["account_number"] as? String
        m_lastPaymentDate = mortgageInfo["last_payment_date"] as? String
        m_loanTerm = mortgageInfo["loan_term"] as? String
        m_loanTypeDescription = mortgageInfo["loan_type_description"] as? String
        m_maturityDate = mortgageInfo["maturity_date"] as? String
        m_nextPaymentDueDate = mortgageInfo["next_payment_due_date"] as? String
        m_originationDate = mortgageInfo["origination_date"] as? String
        
        m_currentLateFee = mortgageInfo["current_late_fee"] as? Double
        m_escrowBalance = mortgageInfo["escrow_balance"] as? Double
        m_lastPaymentAmount = mortgageInfo["last_payment_amount"] as? Double
        m_nextMonthlyPayment = mortgageInfo["next_monthly_payment"] as? Double
        m_originationPrincipalAmount = mortgageInfo["origination_principal_amount"] as? Double
        m_pastDueAmount = mortgageInfo["last_payment_amount"] as? Double
        m_ytdInterestPaid = mortgageInfo["last_payment_amount"] as? Double
        m_ytdPrincipalPaid = mortgageInfo["last_payment_amount"] as? Double
        
        m_hasPmi = mortgageInfo["has_pmi"] as? Bool
        m_hasPrepaymentPenalty = mortgageInfo["has_prepayment_penalty"] as? Bool
        
        let propertyAddress = mortgageInfo["property_address"] as? NSDictionary
        if let _propertyAddress = propertyAddress {
            m_propertyAddress = Address(addressInfo: _propertyAddress)
        }
        
        let interestRate = mortgageInfo["interest_rate"] as? NSDictionary
        if let _interestRate = interestRate {
            m_interestRate = InterestRate(interestRate: _interestRate)
        }
    }
    
    public func getAccountId() -> String {
        StrUtils.unwrapString(value: m_accountId)
    }
    
    public func getAccountNumber() -> String {
        StrUtils.unwrapString(value: m_accountNumber)
    }
    
    public func getLastPaymentDate() -> String {
        StrUtils.unwrapString(value: m_lastPaymentDate)
    }
    
    public func getLoanTerm() -> String {
        StrUtils.unwrapString(value: m_loanTerm)
    }
    
    public func getLoanTypeDescription() -> String {
        StrUtils.unwrapString(value: m_loanTypeDescription)
    }
    
    public func getMaturityDate() -> String {
        StrUtils.unwrapString(value: m_maturityDate)
    }
    
    public func getNextPaymentDueDate() -> String {
        StrUtils.unwrapString(value: m_nextPaymentDueDate)
    }
    
    public func getOriginationDate() -> String {
        StrUtils.unwrapString(value: m_originationDate)
    }
    
    public func getCurrentLateFee() -> Double {
        NumUtils.unwrapDouble(value: m_currentLateFee)
    }
    
    public func getEscrowBalance() -> Double {
        NumUtils.unwrapDouble(value: m_escrowBalance)
    }
    
    public func getLastPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: m_lastPaymentAmount)
    }
    
    public func getOriginationPrincipalAmount() -> Double {
        NumUtils.unwrapDouble(value: m_originationPrincipalAmount)
    }
    
    public func getPastDueAmount() -> Double {
        NumUtils.unwrapDouble(value: m_pastDueAmount)
    }
    
    public func getYtdInterestPaid() -> Double {
        NumUtils.unwrapDouble(value: m_ytdInterestPaid)
    }
    
    public func getYtdPrincipalPaid() -> Double {
        NumUtils.unwrapDouble(value: m_ytdPrincipalPaid)
    }
    
    public func getNextMonthlyPayment() -> Double {
        NumUtils.unwrapDouble(value: m_nextMonthlyPayment)
    }
    
    public func getHasPmi() -> Bool {
        if let hasPmi = m_hasPmi {
            return hasPmi
        }
        
        return false
    }
    
    public func getHasPrepaymentPenalty() -> Bool {
        if let hasPrepaymentPenalty = m_hasPrepaymentPenalty {
            return hasPrepaymentPenalty
        }
        
        return false
    }
    
    public func getPropertyAddress() -> Address? {
        return m_propertyAddress
    }
    
    public func getInterestRate() -> InterestRate? {
        return m_interestRate
    }
    
}
