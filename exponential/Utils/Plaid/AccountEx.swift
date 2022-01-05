//
//  AccountEx.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class AccountEx : Account {
    
    public func setTransactions(_ transactions : [TransactionEx]) {
        self.transactions = transactions
    }
    
    public func setHoldings(_ holdings : [Holding]) {
        self.holdings = holdings
    }
    
    public func setCreditLoans(_ creditLoans : [CreditLoan]) {
        self.creditLoans = creditLoans
    }
    
    public func setMortgages(_ mortgages : [Mortgage]) {
        self.mortgages = mortgages
    }
    
    public func setStudentLoans(_ studentLoans : [StudentLoan]) {
        self.studentLoans = studentLoans
    }
    
    public func getTransactions() -> [TransactionEx] {transactions}
    public func getHoldings() -> [Holding] {holdings}
    public func getCreditLoans() -> [CreditLoan] {creditLoans}
    public func getMortgages() -> [Mortgage] {mortgages}
    public func getStudentLoans() -> [StudentLoan] {studentLoans}
    
    var balance : String {
            StrUtils.showNumberWithCurrency(getBalances().getAvailable() == 0 ? getBalances().getCurrent() : getBalances().getAvailable(),getBalances().getCurrencyCode())
    }
    
    var limit : String {
        StrUtils.showNumberWithCurrency(getBalances().getLimit(), getBalances().getCurrencyCode())
    }
    
    private var transactions = [TransactionEx]()
    private var holdings = [Holding]()
    private var creditLoans = [CreditLoan]()
    private var mortgages = [Mortgage]()
    private var studentLoans = [StudentLoan]()
}
