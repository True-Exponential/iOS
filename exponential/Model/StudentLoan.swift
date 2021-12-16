//
//  StudentLoan.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StudentLoan : Codable {
    
    
    init(studentLoanInfo: NSDictionary) {
        
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
        
        disbursement_dates = studentLoanInfo["disbursement_dates"] as? Array<String>
        
        let loanStatus = studentLoanInfo["loan_status"] as? NSDictionary
        if let _loanStatus = loanStatus {
            self.loan_status = LoanStatus(loanStatusInfo: _loanStatus)
        }
        
        let repaymentPlan = studentLoanInfo["repayment_plan"] as? NSDictionary
        if let _repaymentPlan = repaymentPlan {
            self.repayment_plan = RepaymentPlan(repaymentPlanInfo: _repaymentPlan)
        }
        
        let pslfStatus = studentLoanInfo["pslf_status"] as? NSDictionary
        if let _pslfStatus = pslfStatus {
            self.pslf_status = PslfStatus(pslfStatusInfo: _pslfStatus)
        }
        
        let servicerAddress = studentLoanInfo["servicer_address"] as? NSDictionary
        if let _servicerAddress = servicerAddress {
            self.servicer_address = Address(addressInfo: _servicerAddress)
        }
    }
    
    public func getAccountId() -> String {
        StrUtils.unwrapString(value: account_id)
    }
    
    public func getAccountNumber() -> String {
        StrUtils.unwrapString(value: account_number)
    }
    
    public func getExpectedPayoffDate() -> String {
        StrUtils.unwrapString(value: expected_payoff_date)
    }
    
    public func getLastPaymentDate() -> String {
        StrUtils.unwrapString(value: last_payment_date)
    }
    
    public func getLastStatementIssueDate() -> String {
        StrUtils.unwrapString(value: last_statement_issue_date)
    }
    public func getGuarantor() -> String {
        StrUtils.unwrapString(value: guarantor)
    }
    public func getNextPaymentDueDate() -> String {
        StrUtils.unwrapString(value: next_payment_due_date)
    }
    
    public func getOriginationDate() -> String {
        StrUtils.unwrapString(value: origination_date)
    }
    
    public func getPaymentReferenceNumber() -> String {
        StrUtils.unwrapString(value: payment_reference_number)
    }
    
    public func getLoanName() -> String {
        StrUtils.unwrapString(value: loan_name)
    }
    
    public func getSequenceNumber() -> String {
        StrUtils.unwrapString(value: sequence_number)
    }
    
    public func getInterestRatePercentage() -> Double {
        NumUtils.unwrapDouble(value: interest_rate_percentage)
    }
    
    public func getLastPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: last_payment_amount)
    }
    
    public func getLastStatementBalance() -> Double {
        NumUtils.unwrapDouble(value: last_statement_balance)
    }
    
    public func getMinimumPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: minimum_payment_amount)
    }
    
    public func getOriginationPrincipalAmount() -> Double {
        NumUtils.unwrapDouble(value: origination_principal_amount)
    }
    
    public func getOutstandingInterestAmount() -> Double {
        NumUtils.unwrapDouble(value: outstanding_interest_amount)
    }
    
    public func getYtdInterestPaid() -> Double {
        NumUtils.unwrapDouble(value: ytd_interest_paid)
    }
    
    public func getYtdPrincipalPaid() -> Double {
        NumUtils.unwrapDouble(value: ytd_principal_paid)
    }
    
    public func getIsOverdue() -> Bool {
        
        if let isOverdue = is_overdue {
            return isOverdue
        }
        
        return false;
    }
    
    public func getLoanStatus() -> LoanStatus? {
        return loan_status
    }
    
    public func getRepaymentPlan() -> RepaymentPlan? {
        return repayment_plan
    }
    
    public func getDisbursementDates() -> [String]? {
        return disbursement_dates
    }
    
    public func getPslfStatus() -> PslfStatus? {
        return pslf_status
    }
    
    public func getServicerAddress() -> Address? {
        return servicer_address
    }
    
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
