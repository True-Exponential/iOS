//
//  MortgageLiability.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Mortgage : Codable {
    
    init(mortgageInfo: NSDictionary) {
        account_id = mortgageInfo["account_id"] as? String
        
        account_number = mortgageInfo["account_number"] as? String
        last_payment_date = mortgageInfo["last_payment_date"] as? String
        loan_term = mortgageInfo["loan_term"] as? String
        loan_type_description = mortgageInfo["loan_type_description"] as? String
        maturity_date = mortgageInfo["maturity_date"] as? String
        next_payment_due_date = mortgageInfo["next_payment_due_date"] as? String
        origination_date = mortgageInfo["origination_date"] as? String
        
        current_late_fee = mortgageInfo["current_late_fee"] as? Double
        escrow_balance = mortgageInfo["escrow_balance"] as? Double
        last_payment_amount = mortgageInfo["last_payment_amount"] as? Double
        next_monthly_payment = mortgageInfo["next_monthly_payment"] as? Double
        origination_principal_amount = mortgageInfo["origination_principal_amount"] as? Double
        
        has_pmi = mortgageInfo["has_pmi"] as? Bool
        has_prepayment_penalty = mortgageInfo["has_prepayment_penalty"] as? Bool
        
        let propertyAddress = mortgageInfo["property_address"] as? NSDictionary
        if let _propertyAddress = propertyAddress {
            property_address = Address(addressInfo: _propertyAddress)
        }
        
        let interestRate = mortgageInfo["interest_rate"] as? NSDictionary
        if let _interestRate = interestRate {
            interest_rate = InterestRate(interestRate: _interestRate)
        }
    }
    
    public func getAccountId() -> String {
        StrUtils.unwrapString(value: account_id)
    }
    
    public func getAccountNumber() -> String {
        StrUtils.unwrapString(value: account_number)
    }
    
    public func getLastPaymentDate() -> String {
        StrUtils.unwrapString(value: last_payment_date)
    }
    
    public func getLoanTerm() -> String {
        StrUtils.unwrapString(value: loan_term)
    }
    
    public func getLoanTypeDescription() -> String {
        StrUtils.unwrapString(value: loan_type_description)
    }
    
    public func getMaturityDate() -> String {
        StrUtils.unwrapString(value: maturity_date)
    }
    
    public func getNextPaymentDueDate() -> String {
        StrUtils.unwrapString(value: next_payment_due_date)
    }
    
    public func getOriginationDate() -> String {
        StrUtils.unwrapString(value: origination_date)
    }
    
    public func getCurrentLateFee() -> Double {
        NumUtils.unwrapDouble(value: current_late_fee)
    }
    
    public func getEscrowBalance() -> Double {
        NumUtils.unwrapDouble(value: escrow_balance)
    }
    
    public func getLastPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: last_payment_amount)
    }
    
    public func getOriginationPrincipalAmount() -> Double {
        NumUtils.unwrapDouble(value: origination_principal_amount)
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
        NumUtils.unwrapDouble(value: next_monthly_payment)
    }
    
    public func getHasPmi() -> Bool {
        if let hasPmi = self.has_pmi {
            return hasPmi
        }
        
        return false
    }
    
    public func getHasPrepaymentPenalty() -> Bool {
        if let hasPrepaymentPenalty = self.has_prepayment_penalty {
            return hasPrepaymentPenalty
        }
        
        return false
    }
    
    public func getPropertyAddress() -> Address? {
        return property_address
    }
    
    public func getInterestRate() -> InterestRate? {
        return interest_rate
    }
    
    private var account_id : String?
    private var account_number : String?
    private var last_payment_date : String?
    private var loan_term : String?
    private var loan_type_description : String?
    private var maturity_date : String?
    private var next_payment_due_date : String?
    private var origination_date : String?
    
    private var current_late_fee : Double?
    private var escrow_balance : Double?
    private var last_payment_amount : Double?
    private var next_monthly_payment : Double?
    private var origination_principal_amount : Double?
    private var m_pastDueAmount : Double?
    private var m_ytdInterestPaid : Double?
    private var m_ytdPrincipalPaid : Double?
    
    private var has_pmi : Bool?
    private var has_prepayment_penalty : Bool?
    
    private var property_address : Address?
    private var interest_rate : InterestRate?
    
}
