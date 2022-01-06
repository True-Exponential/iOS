//
//  MortgageLiability.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Mortgage : Codable {
    
    init(_ mortgageInfo: NSDictionary) {
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
        
        if let propertyAddress = mortgageInfo["property_address"] as? NSDictionary {
            property_address = Address(propertyAddress)
        }
        
        if let interestRate = mortgageInfo["interest_rate"] as? NSDictionary {
            interest_rate = InterestRate(interestRate)
        }
    }
    
    func getAccountId() -> String {OptUtils.unwrap(account_id)}
    func getAccountNumber() -> String {OptUtils.unwrap(account_number)}
    func getLastPaymentDate() -> String {OptUtils.unwrap(last_payment_date)}
    func getLoanTerm() -> String {OptUtils.unwrap(loan_term)}
    func getLoanTypeDescription() -> String {OptUtils.unwrap(loan_type_description)}
    func getMaturityDate() -> String {OptUtils.unwrap(maturity_date)}
    func getNextPaymentDueDate() -> String {OptUtils.unwrap(next_payment_due_date)}
    func getOriginationDate() -> String {OptUtils.unwrap(origination_date)}
    func getCurrentLateFee() -> Double {OptUtils.unwrap(current_late_fee)}
    func getEscrowBalance() -> Double {OptUtils.unwrap(escrow_balance)}
    func getLastPaymentAmount() -> Double {OptUtils.unwrap(last_payment_amount)}
    func getOriginationPrincipalAmount() -> Double {OptUtils.unwrap(origination_principal_amount)}
    func getPastDueAmount() -> Double {OptUtils.unwrap(pastDueAmount)}
    func getYtdInterestPaid() -> Double {OptUtils.unwrap(ytdInterestPaid)}
    func getYtdPrincipalPaid() -> Double {OptUtils.unwrap(ytdPrincipalPaid)}
    func getNextMonthlyPayment() -> Double {OptUtils.unwrap(next_monthly_payment)}
    func getHasPmi() -> Bool {OptUtils.unwrap(self.has_pmi)}
    func getHasPrepaymentPenalty() -> Bool {OptUtils.unwrap(self.has_prepayment_penalty)}
    func getPropertyAddress() -> Address {property_address ?? Address()}
    func getInterestRate() -> InterestRate {interest_rate ?? InterestRate()}
    
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
    private var pastDueAmount : Double?
    private var ytdInterestPaid : Double?
    private var ytdPrincipalPaid : Double?
    
    private var has_pmi : Bool?
    private var has_prepayment_penalty : Bool?
    
    private var property_address : Address?
    private var interest_rate : InterestRate?
    
}
