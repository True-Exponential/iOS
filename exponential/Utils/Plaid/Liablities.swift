//
//  Liablities.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Liablities  {
    
    init(){}
    
    init (_ mortgages : [Mortgage],_ creditLoans: [CreditLoan],_ studentLoans:[StudentLoan] ) {
        self.mortgages = mortgages
        self.studentLoans = studentLoans
        self.creditLoans = creditLoans
        
        self.appendMortgagesToAccounts()
        self.appendStudentLoansToAccounts()
        self.appendCreditLoansToAccounts()
    }
    
    init(_ json : [String: Any]?) {
        
        if let data = json {
            if let liablities = data["liabilities"]! as? NSDictionary {
                let creditLoans = liablities["credit"]! as? [NSDictionary] ?? []
                for credirLoanInfo in creditLoans {
                    let creditLoan = CreditLoan(creditLoanInfo:credirLoanInfo)
                    self.creditLoans.append(creditLoan)
                }
                
                self.appendCreditLoansToAccounts()
                
                let mortgages = liablities["mortgage"]! as? [NSDictionary] ?? []
                for mortgageInfo in mortgages {
                    let mortgage = Mortgage(mortgageInfo:mortgageInfo)
                    self.mortgages.append(mortgage)
                }
                
                self.appendMortgagesToAccounts()
                
                let studentLoans = liablities["student"]! as? [NSDictionary] ?? []
                for studentLoanInfo in studentLoans {
                    let studentLoan = StudentLoan(studentLoanInfo)
                    self.studentLoans.append(studentLoan)
                }
                
                self.appendStudentLoansToAccounts()
            }
        }
    }
    
    private func appendStudentLoansToAccounts() {
        var studentLoansByAccount = [String: [StudentLoan]]()
        
        for studentLoan in studentLoans {
            let accountId = studentLoan.getAccountId()
            let account = studentLoansByAccount[accountId]
            
            if account == nil {
                studentLoansByAccount[accountId] = [StudentLoan]()
            }
            
            studentLoansByAccount[accountId]?.append(studentLoan)
        }
        
        Globals.accounts.appeendStudentLoansToAccounts(studentLoansByAccount)
    }
    
    private func appendMortgagesToAccounts() {
        var mortgagesByAccount = [String: [Mortgage]]()
        
        for mortgage in mortgages {
            let accountId = mortgage.getAccountId()
            let account = mortgagesByAccount[accountId]
            
            if account == nil {
                mortgagesByAccount[accountId] = [Mortgage]()
            }
            
            mortgagesByAccount[accountId]?.append(mortgage)
        }
        
        Globals.accounts.appeendMortgagesToAccounts(mortgagesByAccount)
    }
    
    private func appendCreditLoansToAccounts() {
        var creditLoansByAccount = [String: [CreditLoan]]()
        
        for creditLoan in creditLoans {
            let accountId = creditLoan.getAccountId()
            let account = creditLoansByAccount[accountId]
            
            if account == nil {
                creditLoansByAccount[accountId] = [CreditLoan]()
            }
            
            creditLoansByAccount[accountId]?.append(creditLoan)
        }
        
        Globals.accounts.appeendCreditLoansToAccounts(creditLoansByAccount)
    }
    
    public func getCreditLoans() -> [CreditLoan] {creditLoans}
    public func getMortgages() -> [Mortgage] {mortgages}
    public func getStudentLoans() -> [StudentLoan] {studentLoans}
    
    private var creditLoans = [CreditLoan]()
    private var mortgages = [Mortgage]()
    private var studentLoans = [StudentLoan]()
}
