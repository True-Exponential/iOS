//
//  transaction.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Transaction {
    
    private var m_accountId  : String?
    private var m_accountOwner : String?
    private var m_authorizedDate : String?
    private var m_authorizedTime : String?
    private var m_categoryId : String?
    private var m_checkNumber : String?
    private var m_currencyCode : String?
    private var m_date : String?
    private var m_time : String?
    private var m_dateTime : String?
    private var m_name  : String?
    private var m_merchantName : String?
    private var m_channel : String?
    private var m_pendingTransactionId : String?
    private var m_personalFinanceCategory : String?
    private var m_transactionCode : String?
    private var m_transactionId : String?
    private var m_transactionType : String?
    private var m_unofficialCurrencyCode : String?
    
    private var m_amount : Int?
    private var m_isPending : Bool?
    
    private var m_payment : Payment
    private var m_location : Location
    
    private var m_categories : [String]
    
    init(transaction : NSDictionary) {
        m_accountId = transaction["accountId"] as? String
        m_accountOwner = transaction["accountOwner"] as? String
        m_authorizedDate = transaction["authorizedDate"] as? String
        m_authorizedTime = transaction["authorizedTime"] as? String
        m_categoryId = transaction["categoryId"] as? String
        m_checkNumber = transaction["checkNumber"] as? String
        m_currencyCode = transaction["currencyCode"] as? String
        m_merchantName = transaction["merchantName"] as? String
        m_name = transaction["name"] as? String
        m_date = transaction["date"] as? String
        m_dateTime = transaction["datetime"] as? String
        m_pendingTransactionId = transaction["pendingTransactionId"] as? String
        m_personalFinanceCategory = transaction["personalFinanceCategory"] as? String
        m_transactionCode = transaction["transactionCode"] as? String
        m_transactionId = transaction["transactionId"] as? String
        m_transactionType = transaction["transactionType"] as? String
        m_channel = transaction["channel"] as? String
        
        m_categories = transaction["categories"] as! [String]
        
        m_amount = transaction["amount"] as? Int
        m_isPending = transaction["pending"] as? Bool
        
        let payment = transaction["payment"] as! NSDictionary
        m_payment = Payment(payment:payment)
        
        let location = transaction["location"] as! NSDictionary
        m_location = Location(location:location)
        
    }
    
    public func getAccountId() -> String {
        return StrUtils.unwrapString(value:m_accountId);
    }
    
    public func getAccountOwner() -> String {
        return StrUtils.unwrapString(value:m_accountOwner);
    }
    
    public func getAuthorizedDate() -> String {
        return StrUtils.unwrapString(value:m_authorizedDate);
    }
    
    public func getAuthorizedTime() -> String {
        return StrUtils.unwrapString(value:m_authorizedTime);
    }
    
    public func getCategoryId() -> String {
        return StrUtils.unwrapString(value:m_categoryId);
    }
    
    public func getCheckNumber() -> String {
        return StrUtils.unwrapString(value:m_checkNumber);
    }
    
    public func getCurrencyCode() -> String {
        return StrUtils.unwrapString(value:m_currencyCode);
    }
    
    public func getName() -> String {
        return StrUtils.unwrapString(value:m_name);
    }
    
    public func getDate() -> String {
        return StrUtils.unwrapString(value:m_date);
    }
    
    public func getDateTime() -> String {
        return StrUtils.unwrapString(value:m_dateTime);
    }
    
    public func getPendingTransactionId() -> String {
        return StrUtils.unwrapString(value:m_pendingTransactionId);
    }
    
    public func getPersonalFinanceCategory() -> String {
        return StrUtils.unwrapString(value:m_personalFinanceCategory);
    }
    
    public func getTransactionCode() -> String {
        return StrUtils.unwrapString(value:m_transactionCode);
    }
    
    public func getTransactionId() -> String {
        return StrUtils.unwrapString(value:m_transactionId);
    }
    
    public func getMerchantName() -> String {
        return StrUtils.unwrapString(value:m_merchantName);
    }
    
    public func getChannel() -> String {
        return StrUtils.unwrapString(value:m_channel);
    }
    
    public func getIsPending() -> Bool {
        
        if let val = m_isPending {
            return val
        }
        
        return false;
    }
    
    public func getIsAmount() -> Int {
        return NumUtils.unwrapInt(value: m_amount)
    }
    
    public func getPayment() -> Payment {
        return m_payment;
    }
    
    public func getLocation() -> Location {
        return m_location;
    }
    
}
