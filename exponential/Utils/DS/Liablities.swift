//
//  Liablities.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 13/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Liablities {
    private var m_creditLoans = [CreditLoan]()
    private var m_mortgages = [Mortgage]()
    private var m_studentLoans = [StudentLoan]()
    
    init(liablities: NSDictionary) {
        let creditLoans = liablities["credit"]! as? Array<NSDictionary>
        if let _creditLoans = creditLoans {
            for credirLoanInfo in _creditLoans {
                let creditLoan = CreditLoan(creditLoanInfo:credirLoanInfo)
                m_creditLoans.append(creditLoan)
            }
        }
        
        let mortgages = liablities["mortgage"]! as? Array<NSDictionary>
        if let _mortgages = mortgages {
            for mortgageInfo in _mortgages {
                let mortgage = Mortgage(mortgageInfo:mortgageInfo)
                m_mortgages.append(mortgage)
            }
        }
        
        let studentLoans = liablities["student"]! as? Array<NSDictionary>
        if let _studentLoans = studentLoans {
            for studentLoanInfo in _studentLoans {
                let studentLoan = StudentLoan(studentLoanInfo:studentLoanInfo)
                m_studentLoans.append(studentLoan)
            }
        }
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
}
