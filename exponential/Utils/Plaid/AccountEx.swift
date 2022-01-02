//
//  AccountEx.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class AccountEx : Account {
    
    public func setTransactions(_ transactions : [TransactionEx]) {
        self.m_transactions = transactions
    }
    
    public func setHoldings(_ holdings : [Holding]) {
        self.m_holdings = holdings
    }
    
    public func setCreditLoans(_ creditLoans : [CreditLoan]) {
        self.m_creditLoans = creditLoans
    }
    
    public func setMortgages(_ mortgages : [Mortgage]) {
        self.m_mortgages = mortgages
    }
    
    public func setStudentLoans(_ studentLoans : [StudentLoan]) {
        m_studentLoans = studentLoans
    }
    
    public func getTransactions() -> [TransactionEx] {
        return m_transactions
    }
    
    public func getHoldings() -> [Holding] {
        return m_holdings
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
    
    public func getBalance() -> String {
        var retBalance = ""
        if getBalances().getAvailable() == 0 {
            retBalance = StrUtils.showNumberWithCurrency(getBalances().getCurrent(),  getBalances().getCurrencyCode())
        }
        else {
            retBalance = StrUtils.showNumberWithCurrency(getBalances().getCurrent(),  getBalances().getCurrencyCode())
        }
    
        return retBalance
    }
    
    public func getLimit() -> String {
        return StrUtils.showNumberWithCurrency(getBalances().getLimit(), getBalances().getCurrencyCode())
    }
    
    private var m_transactions = [TransactionEx]()
    private var m_holdings = [Holding]()
    private var m_creditLoans = [CreditLoan]()
    private var m_mortgages = [Mortgage]()
    private var m_studentLoans = [StudentLoan]()
}
