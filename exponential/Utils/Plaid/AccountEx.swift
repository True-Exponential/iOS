//
//  AccountEx.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class AccountEx : Account {
    
    func setTransactions(_ transactions : [TransactionEx]) {
        self.transactions = transactions
    }
    
    func setHoldings(_ holdings : [Holding]) {
        self.holdings = holdings
    }
    
    func setCreditLoans(_ creditLoans : [CreditLoan]) {
        self.creditLoans = creditLoans
    }
    
    func setMortgages(_ mortgages : [Mortgage]) {
        self.mortgages = mortgages
    }
    
    func setStudentLoans(_ studentLoans : [StudentLoan]) {
        self.studentLoans = studentLoans
    }
    
    func getTransactions() -> [TransactionEx] {transactions}
    func getHoldings() -> [Holding] {holdings}
    func getCreditLoans() -> [CreditLoan] {creditLoans}
    func getMortgages() -> [Mortgage] {mortgages}
    func getStudentLoans() -> [StudentLoan] {studentLoans}
    
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
