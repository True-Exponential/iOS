//
//  transaction.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Transaction :  Codable {
    
    init(transaction : NSDictionary) {
        accountId = transaction["accountId"] as? String
        accountOwner = transaction["accountOwner"] as? String
        authorizedDate = transaction["authorizedDate"] as? String
        authorizedTime = transaction["authorizedTime"] as? String
        categoryId = transaction["categoryId"] as? String
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
        return StrUtils.unwrapString(value:accountId);
    }
    
    public func getAccountOwner() -> String {
        return StrUtils.unwrapString(value:accountOwner);
    }
    
    public func getAuthorizedDate() -> String {
        return StrUtils.unwrapString(value:authorizedDate);
    }
    
    public func getAuthorizedTime() -> String {
        return StrUtils.unwrapString(value:authorizedTime);
    }
    
    public func getCategoryId() -> String {
        return StrUtils.unwrapString(value:categoryId);
    }
    
    public func getCheckNumber() -> String {
        return StrUtils.unwrapString(value:checkNumber);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value:currencyCode);
    }
    
    public func getName() -> String {
        return StrUtils.unwrapString(value:name);
    }
    
    public func getDate() -> String {
        return StrUtils.unwrapString(value:date);
    }
    
    public func getDateTime() -> String {
        return StrUtils.unwrapString(value:dateTime);
    }
    
    public func getPendingTransactionId() -> String {
        return StrUtils.unwrapString(value:pendingTransactionId);
    }
    
    public func getPersonalFinanceCategory() -> String {
        return StrUtils.unwrapString(value:personalFinanceCategory);
    }
    
    public func getTransactionCode() -> String {
        return StrUtils.unwrapString(value:transactionCode);
    }
    
    public func getTransactionId() -> String {
        return StrUtils.unwrapString(value:transactionId);
    }
    
    public func getMerchantName() -> String {
        return StrUtils.unwrapString(value:merchantName);
    }
    
    public func getChannel() -> String {
        return StrUtils.unwrapString(value:channel);
    }
    
    public func getIsPending() -> Bool {
        
        if let val = pending {
            return val
        }
        
        return false;
    }
    
    public func getIsAmount() -> Int {
        return NumUtils.unwrapInt(value: amount)
    }
    
    public func getPayment() -> Payment {
        return payment;
    }
    
    public func getLocation() -> Location {
        return location;
    }
    
    private var accountId  : String?
    private var accountOwner : String?
    private var authorizedDate : String?
    private var authorizedTime : String?
    private var categoryId : String?
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
