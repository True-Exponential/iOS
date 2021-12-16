//
//  payment.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Payment :  Codable {
    
    init(payment : NSDictionary) {
        byOrderOf = payment["byOrderOf"] as? String
        payee = payment["payee"] as? String
        payer = payment["payer"] as? String
        method = payment["method"] as? String
        processor = payment["processor"] as? String
        reason = payment["reason"] as? String
        id = payment["id"] as? String
        refNumber = payment["refNumber"] as? String
    }
    
    public func getPayer() -> String {
        return StrUtils.unwrapString(value:payer);
    }
    
    public func getOrderOf() -> String {
        return StrUtils.unwrapString(value:byOrderOf);
    }
    
    public func getPayee() -> String {
        return StrUtils.unwrapString(value:payee);
    }
    
    public func getMethod() -> String {
        return StrUtils.unwrapString(value:method);
    }
    
    public func getProcessor() -> String {
        return StrUtils.unwrapString(value:processor);
    }
    
    public func getReason() -> String {
        return StrUtils.unwrapString(value:reason);
    }
    
    public func getId() -> String {
        return StrUtils.unwrapString(value:id);
    }
    
    public func getRefNumber() -> String {
        return StrUtils.unwrapString(value:refNumber);
    }
    
    private var byOrderOf  : String?
    private var payee : String?
    private var payer : String?
    private var method : String?
    private var processor : String?
    private var reason : String?
    private var id : String?
    private var refNumber : String?

}
