//
//  StudentLoan.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StudentLoan : Codable {
    
    
    init(_ studentLoanInfo: NSDictionary) {
        
        account_id = studentLoanInfo["account_id"] as? String
        
        account_number = studentLoanInfo["account_number"] as? String
        expected_payoff_date = studentLoanInfo["expected_payoff_date"] as? String
        last_payment_date = studentLoanInfo["last_payment_date"] as? String
        last_statement_issue_date = studentLoanInfo["last_statement_issue_date"] as? String
        guarantor = studentLoanInfo["guarantor"] as? String
        next_payment_due_date = studentLoanInfo["next_payment_due_date"] as? String
        origination_date = studentLoanInfo["origination_date"] as? String
        payment_reference_number = studentLoanInfo["payment_reference_number"] as? String
        loan_name = studentLoanInfo["loan_name"] as? String
        sequence_number = studentLoanInfo["sequence_number"] as? String
        
        interest_rate_percentage = studentLoanInfo["interest_rate_percentage"] as? Double
        last_payment_amount = studentLoanInfo["last_payment_amount"] as? Double
        last_statement_balance = studentLoanInfo["last_statement_balance"] as? Double
        minimum_payment_amount = studentLoanInfo["minimum_payment_amount"] as? Double
        origination_principal_amount = studentLoanInfo["origination_principal_amount"] as? Double
        outstanding_interest_amount = studentLoanInfo["outstanding_interest_amount"] as? Double
        ytd_interest_paid = studentLoanInfo["ytd_interest_paid"] as? Double
        ytd_principal_paid = studentLoanInfo["ytd_principal_paid"] as? Double
        
        is_overdue = studentLoanInfo["is_overdue"] as? Bool
        
        disbursement_dates = studentLoanInfo["disbursement_dates"] as? [String]
        
        if let loanStatus = studentLoanInfo["loan_status"] as? NSDictionary {
            self.loan_status = LoanStatus(loanStatus)
        }
        
        if let repaymentPlan = studentLoanInfo["repayment_plan"] as? NSDictionary {
            self.repayment_plan = RepaymentPlan(repaymentPlan)
        }
        
        if let pslfStatus = studentLoanInfo["pslf_status"] as? NSDictionary {
            self.pslf_status = PslfStatus(pslfStatus)
        }
        
        if let servicerAddress = studentLoanInfo["servicer_address"] as? NSDictionary {
            self.servicer_address = Address(servicerAddress)
        }
    }
    
    func getAccountId() -> String {OptUtils.unwrap(account_id)}
    func getAccountNumber() -> String {OptUtils.unwrap(account_number)}
    func getExpectedPayoffDate() -> String {OptUtils.unwrap(expected_payoff_date)}
    func getLastPaymentDate() -> String {OptUtils.unwrap(last_payment_date)}
    func getLastStatementIssueDate() -> String {OptUtils.unwrap(last_statement_issue_date)}
    func getGuarantor() -> String {OptUtils.unwrap(guarantor)}
    func getNextPaymentDueDate() -> String {OptUtils.unwrap(next_payment_due_date)}
    func getOriginationDate() -> String {OptUtils.unwrap(origination_date)}
    func getPaymentReferenceNumber() -> String {OptUtils.unwrap(payment_reference_number)}
    func getLoanName() -> String {OptUtils.unwrap(loan_name)}
    func getSequenceNumber() -> String {OptUtils.unwrap(sequence_number)}
    func getInterestRatePercentage() -> Double {OptUtils.unwrap(interest_rate_percentage)}
    func getLastPaymentAmount() -> Double {OptUtils.unwrap(last_payment_amount)}
    func getLastStatementBalance() -> Double {OptUtils.unwrap(last_statement_balance)}
    func getMinimumPaymentAmount() -> Double {OptUtils.unwrap(minimum_payment_amount)}
    func getOriginationPrincipalAmount() -> Double {OptUtils.unwrap(origination_principal_amount)}
    func getOutstandingInterestAmount() -> Double {OptUtils.unwrap(outstanding_interest_amount)}
    func getYtdInterestPaid() -> Double {OptUtils.unwrap(ytd_interest_paid)}
    func getYtdPrincipalPaid() -> Double {OptUtils.unwrap(ytd_principal_paid)}
    func getIsOverdue() -> Bool {OptUtils.unwrap(is_overdue)}
    func getLoanStatus() -> LoanStatus {loan_status ?? LoanStatus()}
    func getRepaymentPlan() -> RepaymentPlan {repayment_plan ?? RepaymentPlan()}
    func getDisbursementDates() -> [String] {disbursement_dates ?? [String]()}
    func getPslfStatus() -> PslfStatus {pslf_status ?? PslfStatus()}
    func getServicerAddress() -> Address {servicer_address ?? Address()}
    
    private var account_id : String?
    private var account_number : String?
    private var expected_payoff_date : String?
    private var last_payment_date : String?
    private var last_statement_issue_date : String?
    private var guarantor : String?
    private var next_payment_due_date : String?
    private var origination_date : String?
    private var payment_reference_number : String?
    private var loan_name : String?
    private var sequence_number : String?
    
    private var disbursement_dates : [String]?
    
    private var interest_rate_percentage : Double?
    private var last_payment_amount : Double?
    private var last_statement_balance : Double?
    private var minimum_payment_amount : Double?
    private var origination_principal_amount : Double?
    private var outstanding_interest_amount : Double?
    private var ytd_interest_paid : Double?
    private var ytd_principal_paid : Double?
    
    private var is_overdue : Bool?
    
    private var loan_status : LoanStatus?
    private var repayment_plan : RepaymentPlan?
    private var pslf_status : PslfStatus?
    private var servicer_address : Address?
}
