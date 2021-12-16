//
//  AccountEx.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class AccountEx : Account {
    
    public func setTransactions(transactions : [Transaction]) {
        self.m_transactions = transactions
    }
    
    public func setHoldings(holdings : [Holding]) {
        self.m_holdings = holdings
    }
    
    public func setCreditLoans(creditLoans : [CreditLoan]) {
        self.m_creditLoans = creditLoans
    }
    
    public func setMortgages(mortgages : [Mortgage]) {
        self.m_mortgages = mortgages
    }
    
    public func setStudentLoans(studentLoans : [StudentLoan]) {
        m_studentLoans = studentLoans
    }
    
    public func getTransactions() -> [Transaction] {
        return m_transactions;
    }
    
    public func getHoldings() -> [Holding] {
        return m_holdings;
    }
    
    public func getCreditLoans() -> [CreditLoan] {
        return m_creditLoans;
    }
    
    public func getMortgages() -> [Mortgage] {
        return m_mortgages;
    }
    
    public func getStudentLoans() -> [StudentLoan] {
        return m_studentLoans;
    }

    
    private var m_transactions = [Transaction]()
    private var m_holdings = [Holding]()
    private var m_creditLoans = [CreditLoan]()
    private var m_mortgages = [Mortgage]()
    private var m_studentLoans = [StudentLoan]()
    
}
