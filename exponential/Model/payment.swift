//
//  payment.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Payment :  Codable {
    
    init(){}
    
    init(_ payment : NSDictionary) {
        byOrderOf = payment["byOrderOf"] as? String
        payee = payment["payee"] as? String
        payer = payment["payer"] as? String
        method = payment["method"] as? String
        processor = payment["processor"] as? String
        reason = payment["reason"] as? String
        id = payment["id"] as? String
        refNumber = payment["refNumber"] as? String
    }
    
    func getPayer() -> String {OptUtils.unwrap(payer)}
    func getOrderOf() -> String {OptUtils.unwrap(byOrderOf)}
    func getPayee() -> String {OptUtils.unwrap(payee)}
    func getMethod() -> String {OptUtils.unwrap(method)}
    func getProcessor() -> String {OptUtils.unwrap(processor)}
    func getReason() -> String {OptUtils.unwrap(reason)}
    func getId() -> String {OptUtils.unwrap(id)}
    func getRefNumber() -> String {OptUtils.unwrap(refNumber)}
    
    private var byOrderOf  : String?
    private var payee : String?
    private var payer : String?
    private var method : String?
    private var processor : String?
    private var reason : String?
    private var id : String?
    private var refNumber : String?

}
