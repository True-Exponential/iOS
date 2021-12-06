//
//  payment.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Payment {
    private var m_byOrderOf  : String?
    private var m_payee : String?
    private var m_payer : String?
    private var m_method : String?
    private var m_processor : String?
    private var m_reason : String?
    private var m_id : String?
    private var m_refNumber : String?
    
    init(payment : NSDictionary) {
        m_byOrderOf = payment["byOrderOf"] as? String
        m_payee = payment["payee"] as? String
        m_payer = payment["payer"] as? String
        m_method = payment["method"] as? String
        m_processor = payment["processor"] as? String
        m_reason = payment["reason"] as? String
        m_id = payment["id"] as? String
        m_refNumber = payment["refNumber"] as? String
    }
    
    public func getPayer() -> String {
        return StrUtils.unwrapString(value:m_payer);
    }
    
    public func getOrderOf() -> String {
        return StrUtils.unwrapString(value:m_byOrderOf);
    }
    
    public func getPayee() -> String {
        return StrUtils.unwrapString(value:m_payee);
    }
    
    public func getMethod() -> String {
        return StrUtils.unwrapString(value:m_method);
    }
    
    public func getProcessor() -> String {
        return StrUtils.unwrapString(value:m_processor);
    }
    
    public func getReason() -> String {
        return StrUtils.unwrapString(value:m_reason);
    }
    
    public func getId() -> String {
        return StrUtils.unwrapString(value:m_id);
    }
    
    public func getRefNumber() -> String {
        return StrUtils.unwrapString(value:m_refNumber);
    }
}
