//
//  Liablities.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Liablities  {
    
    init(){}
    
    init (_ mortgages : [Mortgage],_ creditLoans: [CreditLoan],_ studentLoans:[StudentLoan] ) {
        self.m_mortgages = mortgages
        self.m_studentLoans = studentLoans
        self.m_creditLoans = creditLoans
        
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
                    m_creditLoans.append(creditLoan)
                }
                
                self.appendCreditLoansToAccounts()
                
                let mortgages = liablities["mortgage"]! as? [NSDictionary] ?? []
                for mortgageInfo in mortgages {
                    let mortgage = Mortgage(mortgageInfo:mortgageInfo)
                    m_mortgages.append(mortgage)
                }
                
                self.appendMortgagesToAccounts()
                
                let studentLoans = liablities["student"]! as? [NSDictionary] ?? []
                for studentLoanInfo in studentLoans {
                    let studentLoan = StudentLoan(studentLoanInfo)
                    m_studentLoans.append(studentLoan)
                }
                
                self.appendStudentLoansToAccounts()
            }
        }
    }
    
    private func appendStudentLoansToAccounts() {
        var studentLoansByAccount = [String: [StudentLoan]]()
        
        for studentLoan in m_studentLoans {
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
        
        for mortgage in m_mortgages {
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
        
        for creditLoan in m_creditLoans {
            let accountId = creditLoan.getAccountId()
            let account = creditLoansByAccount[accountId]
            
            if account == nil {
                creditLoansByAccount[accountId] = [CreditLoan]()
            }
            
            creditLoansByAccount[accountId]?.append(creditLoan)
        }
        
        Globals.accounts.appeendCreditLoansToAccounts(creditLoansByAccount)
    }
    
    public func getCreditLoans() -> [CreditLoan] {
        return m_creditLoans
    }
    
    public func getMortgages() -> [Mortgage] {
        return m_mortgages
    }
    
    public func getStudentLoans() -> [StudentLoan] {
        return m_studentLoans
    }
    
    private var m_creditLoans = [CreditLoan]()
    private var m_mortgages = [Mortgage]()
    private var m_studentLoans = [StudentLoan]()
}
