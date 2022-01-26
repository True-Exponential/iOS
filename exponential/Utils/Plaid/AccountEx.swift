//
//  AccountEx.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 16/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class AccountEx : Account, Identifiable {
    
    override init(_ name: String,_ type: AccountType) {
        super.init(name,type)
    }
    
    override init(_ account: Account){
        super.init(account)
    }
    
    override init(_ account: NSDictionary) {
        super.init(account)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
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
    
    func getTransactions(_ sortType: SortType) -> [TransactionEx]
    {
        switch (sortType) {
        case .amount :
            return transactions.sorted(by: { lhs, rhs in
                return lhs.getAmount() > rhs.getAmount()
              })
            
        case .date:
            return transactions
            
        case .categories:
            return transactions.sorted(by: { lhs, rhs in
                return lhs.getCategoryId() > rhs.getCategoryId()
              })
        }
    }
    
    func totalTransactionsByCategory(_ categoryId : String) -> Int {
        transactions.filter { $0.getCategoryId() == categoryId }.count
    }
    
    func totalSpendingByCategory(_ categoryId : String) -> String {
        let tansactions : [TransactionEx] = transactions.filter { $0.getCategoryId() == categoryId }
        
        let spendingTotal = tansactions.reduce(0, { x, y in
            x + y.getAmount()
        })
        
        return StrUtils.showNumberWithCurrency(spendingTotal, tansactions[0].getCurrencyCode())
    }
    
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
