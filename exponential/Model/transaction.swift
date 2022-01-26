//
//  transaction.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class Transaction :  Codable {
    
    init() {}
    
    init(_ name: String, _ categoryId : String, _ amount : Double, _ date: String) {
        self.name = name
        self.category_id = categoryId
        self.amount = amount
        self.authorizedDate = date
    }
    
    init(_ transaction : Transaction) {
        accountId = transaction.getAccountId()
        accountOwner = transaction.getAccountOwner()
        authorizedDate = transaction.getAuthorizedDate()
        authorizedTime = transaction.getAuthorizedTime()
        category_id = transaction.getCategoryId()
        checkNumber = transaction.getCheckNumber()
        currencyCode = transaction.getCurrencyCode()
        merchantName = transaction.getMerchantName()
        name = transaction.getName()
        date = transaction.getDate()
        dateTime = transaction.getDateTime()
        pendingTransactionId = transaction.getPendingTransactionId()
        personalFinanceCategory = transaction.getPersonalFinanceCategory()
        transactionCode = transaction.getTransactionCode()
        transactionId = transaction.getTransactionId()
        transactionType = transaction.getTransactionType()
        channel = transaction.getChannel()
        
        categories = transaction.getCategories()
        
        amount = transaction.getAmount()
        pending = transaction.getIsPending()
        
        payment = transaction.getPayment()
        
        location = transaction.getLocation()
    }
    
    init(_ transaction : NSDictionary) {
        accountId = transaction["accountId"] as? String
        accountOwner = transaction["accountOwner"] as? String
        authorizedDate = transaction["authorizedDate"] as? String
        authorizedTime = transaction["authorizedTime"] as? String
        category_id = transaction["category_id"] as? String
        checkNumber = transaction["checkNumber"] as? String
        currencyCode = transaction["currencyCode"] as? String
        merchantName = transaction["merchantName"] as? String
        name = transaction["name"] as? String
        date = transaction["date"] as? String
        dateTime = transaction["datetime"] as? String
        pendingTransactionId = transaction["pendingTransactionId"] as? String
        personalFinanceCategory = transaction["personalFinanceCategory"] as? String
        transactionCode = transaction["transactionCode"] as? String
        transactionId = transaction["transactionId"] as? String
        transactionType = transaction["transactionType"] as? String
        channel = transaction["channel"] as? String
        
        categories = transaction["categories"] as? [String] ?? []
        
        amount = transaction["amount"] as? Double
        pending = transaction["pending"] as? Bool
        
        if let payment = transaction["payment"] as? NSDictionary {
            self.payment = Payment(payment)
        }
        
        if let location = transaction["location"] as? NSDictionary {
            self.location = Location(location)
        }
    }
    
    func getAccountId() -> String {OptUtils.unwrap(accountId)
        
    }
    
    func getTransactionType() -> String {OptUtils.unwrap(transactionType)
        
    }
    
    func getAccountOwner() -> String {OptUtils.unwrap(accountOwner)
        
    }
    
    func getAuthorizedDate() -> String {
        OptUtils.unwrap(authorizedDate)
    }
    
    func getAuthorizedTime() -> String {
        OptUtils.unwrap(authorizedTime)
    }
    
    func getCategoryId() -> String {
        OptUtils.unwrap(category_id)
    }
    
    func getCheckNumber() -> String {OptUtils.unwrap(checkNumber)}
    func getCurrencyCode() -> String {OptUtils.unwrap(currencyCode)}
    func getName() -> String {OptUtils.unwrap(name)}
    func getDate() -> String {OptUtils.unwrap(date)}
    func getDateTime() -> String {OptUtils.unwrap(dateTime)}
    func getPendingTransactionId() -> String {OptUtils.unwrap(pendingTransactionId)}
    func getPersonalFinanceCategory() -> String {OptUtils.unwrap(personalFinanceCategory)}
    func getTransactionCode() -> String {OptUtils.unwrap(transactionCode)}
    func getTransactionId() -> String {OptUtils.unwrap(transactionId)}
    func getMerchantName() -> String {OptUtils.unwrap(merchantName)}
    func getChannel() -> String {OptUtils.unwrap(channel)}
    func getIsPending() -> Bool {OptUtils.unwrap(pending)}
    func getAmount() -> Double {OptUtils.unwrap( amount)}
    func getPayment() -> Payment {payment}
    func getLocation() -> Location {location}
    func getCategories() -> [String] {categories}
    
    private var accountId  : String? = nil
    private var accountOwner : String?  = nil
    private var authorizedDate : String? = nil
    private var authorizedTime : String?  = nil
    private var category_id : String?  = nil
    private var checkNumber : String?  = nil
    private var currencyCode : String?  = nil
    private var date : String?  = nil
    private var time : String?  = nil
    private var dateTime : String?  = nil
    private var name  : String?  = nil
    private var merchantName : String?  = nil
    private var channel : String?  = nil
    private var pendingTransactionId : String?  = nil
    private var personalFinanceCategory : String?  = nil
    private var transactionCode : String?  = nil
    private var transactionId : String?  = nil
    private var transactionType : String?  = nil
    private var unofficialCurrencyCode : String?  = nil
    
    private var amount : Double?  = nil
    private var pending : Bool?  = nil
    
    private var payment = Payment()
    private var location = Location()
    
    private var categories = [String]()
}
