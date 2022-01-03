//
//  transaction.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class Transaction :  Codable {
    
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
        
        categories = transaction["categories"] as! [String]
        
        amount = transaction["amount"] as? Int
        pending = transaction["pending"] as? Bool
        
        let payment = transaction["payment"] as! NSDictionary
        self.payment = Payment(payment:payment)
        
        let location = transaction["location"] as! NSDictionary
        self.location = Location(location:location)
    }
    
    public func getAccountId() -> String {
        return OptUtils.unwrap(accountId)
    }
    
    public func getTransactionType() -> String {
        return OptUtils.unwrap(transactionType)
    }
    
    public func getAccountOwner() -> String {
        return OptUtils.unwrap(accountOwner)
    }
    
    public func getAuthorizedDate() -> String {
        return OptUtils.unwrap(authorizedDate)
    }
    
    public func getAuthorizedTime() -> String {
        return OptUtils.unwrap(authorizedTime)
    }
    
    public func getCategoryId() -> String {
        return OptUtils.unwrap(category_id)
    }
    
    public func getCheckNumber() -> String {
        return OptUtils.unwrap(checkNumber)
    }
    
    public func getCurrencyCode() -> String {
        return OptUtils.unwrap(currencyCode)
    }
    
    public func getName() -> String {
        return OptUtils.unwrap(name)
    }
    
    public func getDate() -> String {
        return OptUtils.unwrap(date)
    }
    
    public func getDateTime() -> String {
        return OptUtils.unwrap(dateTime)
    }
    
    public func getPendingTransactionId() -> String {
        return OptUtils.unwrap(pendingTransactionId)
    }
    
    public func getPersonalFinanceCategory() -> String {
        return OptUtils.unwrap(personalFinanceCategory)
    }
    
    public func getTransactionCode() -> String {
        return OptUtils.unwrap(transactionCode)
    }
    
    public func getTransactionId() -> String {
        return OptUtils.unwrap(transactionId)
    }
    
    public func getMerchantName() -> String {
        return OptUtils.unwrap(merchantName)
    }
    
    public func getChannel() -> String {
        return OptUtils.unwrap(channel)
    }
    
    public func getIsPending() -> Bool {
        return OptUtils.unwrap(pending)
    }
    
    public func getAmount() -> Int {
        return OptUtils.unwrap( amount)
    }
    
    public func getPayment() -> Payment {
        return payment
    }
    
    public func getLocation() -> Location {
        return location
    }
    
    public func getCategories() -> [String] {
        return categories
    }
    
    private var accountId  : String?
    private var accountOwner : String?
    private var authorizedDate : String?
    private var authorizedTime : String?
    private var category_id : String?
    private var checkNumber : String?
    private var currencyCode : String?
    private var date : String?
    private var time : String?
    private var dateTime : String?
    private var name  : String?
    private var merchantName : String?
    private var channel : String?
    private var pendingTransactionId : String?
    private var personalFinanceCategory : String?
    private var transactionCode : String?
    private var transactionId : String?
    private var transactionType : String?
    private var unofficialCurrencyCode : String?
    
    private var amount : Int?
    private var pending : Bool?
    
    private var payment : Payment
    private var location : Location
    
    private var categories : [String]    
}