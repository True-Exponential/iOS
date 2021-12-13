//
//  StudentLoan.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StudentLoan {
    
    private var m_accountId : String?
    
    private var m_accountNumber : String?
    private var m_expectedPayoffDate : String?
    private var m_lastPaymentDate : String?
    private var m_lastStatementIssueDate : String?
    private var m_guarantor : String?
    private var m_nextPaymentDueDate : String?
    private var m_originationDate : String?
    private var m_paymentReferenceNumber : String?
    private var m_loanName : String?
    private var m_sequenceNumber : String?
    
    private var m_interestRatePercentage : Double?
    private var m_lastPaymentAmount : Double?
    private var m_lastStatementBalance : Double?
    private var m_minimumPaymentAmount : Double?
    private var m_originationPrincipalAmount : Double?
    private var m_outstandingInterestAmount : Double?
    private var m_ytdInterestPaid : Double?
    private var m_ytdPrincipalPaid : Double?
    
    private var m_isOverdue : Bool?
    
    private var m_loanStatus : LoanStatus?
    private var m_repaymentPlan : RepaymentPlan?
    private var m_pslfStatus : PslfStatus?
    private var m_servicerAddress : Address?
    
    private var m_disbursementDates : [String]?
    
    
    init(studentLoanInfo: NSDictionary) {
        
        m_accountId = studentLoanInfo["account_id"] as? String
        
        m_accountNumber = studentLoanInfo["account_number"] as? String
        m_expectedPayoffDate = studentLoanInfo["expected_payoff_date"] as? String
        m_lastPaymentDate = studentLoanInfo["last_payment_date"] as? String
        m_lastStatementIssueDate = studentLoanInfo["last_statement_issue_date"] as? String
        m_guarantor = studentLoanInfo["guarantor"] as? String
        m_nextPaymentDueDate = studentLoanInfo["next_payment_due_date"] as? String
        m_originationDate = studentLoanInfo["origination_date"] as? String
        m_paymentReferenceNumber = studentLoanInfo["payment_reference_number"] as? String
        m_loanName = studentLoanInfo["loan_name"] as? String
        m_sequenceNumber = studentLoanInfo["sequence_number"] as? String
        
        m_interestRatePercentage = studentLoanInfo["interest_rate_percentage"] as? Double
        m_lastPaymentAmount = studentLoanInfo["last_payment_amount"] as? Double
        m_lastStatementBalance = studentLoanInfo["last_statement_balance"] as? Double
        m_minimumPaymentAmount = studentLoanInfo["minimum_payment_amount"] as? Double
        m_originationPrincipalAmount = studentLoanInfo["origination_principal_amount"] as? Double
        m_outstandingInterestAmount = studentLoanInfo["outstanding_interest_amount"] as? Double
        m_ytdInterestPaid = studentLoanInfo["ytd_interest_paid"] as? Double
        m_ytdPrincipalPaid = studentLoanInfo["ytd_principal_paid"] as? Double
        
        m_isOverdue = studentLoanInfo["is_overdue"] as? Bool
        
        m_disbursementDates = studentLoanInfo["disbursement_dates"] as? Array<String>
        
        let loanStatus = studentLoanInfo["loan_status"] as? NSDictionary
        if let _loanStatus = loanStatus {
            m_loanStatus = LoanStatus(loanStatusInfo: _loanStatus)
        }
        
        let repaymentPlan = studentLoanInfo["repayment_plan"] as? NSDictionary
        if let _repaymentPlan = repaymentPlan {
            m_repaymentPlan = RepaymentPlan(repaymentPlanInfo: _repaymentPlan)
        }
        
        let pslfStatus = studentLoanInfo["pslf_status"] as? NSDictionary
        if let _pslfStatus = pslfStatus {
            m_pslfStatus = PslfStatus(pslfStatusInfo: _pslfStatus)
        }
        
        let servicerAddress = studentLoanInfo["servicer_address"] as? NSDictionary
        if let _servicerAddress = servicerAddress {
            m_servicerAddress = Address(addressInfo: _servicerAddress)
        }
    }
    
    public func getAccountId() -> String {
        StrUtils.unwrapString(value: m_accountId)
    }
    
    public func getAccountNumber() -> String {
        StrUtils.unwrapString(value: m_accountNumber)
    }
    
    public func getExpectedPayoffDate() -> String {
        StrUtils.unwrapString(value: m_expectedPayoffDate)
    }
    
    public func getLastPaymentDate() -> String {
        StrUtils.unwrapString(value: m_lastPaymentDate)
    }
    
    public func getLastStatementIssueDate() -> String {
        StrUtils.unwrapString(value: m_lastStatementIssueDate)
    }
    public func getGuarantor() -> String {
        StrUtils.unwrapString(value: m_guarantor)
    }
    public func getNextPaymentDueDate() -> String {
        StrUtils.unwrapString(value: m_nextPaymentDueDate)
    }
    
    public func getOriginationDate() -> String {
        StrUtils.unwrapString(value: m_originationDate)
    }
    
    public func getPaymentReferenceNumber() -> String {
        StrUtils.unwrapString(value: m_paymentReferenceNumber)
    }
    
    public func getLoanName() -> String {
        StrUtils.unwrapString(value: m_loanName)
    }
    
    public func getSequenceNumber() -> String {
        StrUtils.unwrapString(value: m_sequenceNumber)
    }
    
    public func getInterestRatePercentage() -> Double {
        NumUtils.unwrapDouble(value: m_interestRatePercentage)
    }
    
    public func getLastPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: m_lastPaymentAmount)
    }
    
    public func getLastStatementBalance() -> Double {
        NumUtils.unwrapDouble(value: m_lastStatementBalance)
    }
    
    public func getMinimumPaymentAmount() -> Double {
        NumUtils.unwrapDouble(value: m_minimumPaymentAmount)
    }
    
    public func getOriginationPrincipalAmount() -> Double {
        NumUtils.unwrapDouble(value: m_originationPrincipalAmount)
    }
    
    public func getOutstandingInterestAmount() -> Double {
        NumUtils.unwrapDouble(value: m_outstandingInterestAmount)
    }
    
    public func getYtdInterestPaid() -> Double {
        NumUtils.unwrapDouble(value: m_ytdInterestPaid)
    }
    
    public func getYtdPrincipalPaid() -> Double {
        NumUtils.unwrapDouble(value: m_ytdPrincipalPaid)
    }
    
    public func getIsOverdue() -> Bool {
        
        if let isOverdue = m_isOverdue {
            return isOverdue
        }
        
        return false;
    }
    
    public func getLoanStatus() -> LoanStatus? {
        return m_loanStatus
    }
    
    public func getRepaymentPlan() -> RepaymentPlan? {
        return m_repaymentPlan
    }
    
    public func getDisbursementDates() -> [String]? {
        return m_disbursementDates
    }
    
    public func getPslfStatus() -> PslfStatus? {
        return m_pslfStatus
    }
    
    public func getServicerAddress() -> Address? {
        return m_servicerAddress
    }
    
}
