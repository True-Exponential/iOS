//
//  account.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 05/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class Account : Codable {
    
    init(account : Account) {
        name = account.getName()
        official_name = account.getOfficialName()
        mask = account.getMask()
        id = account.getId()
        type = account.getType()
        subType = account.getSubType()
        typeDesc = account.getTypeDesc()
        subTypeDesc = account.getSubTypeDesc()
        balances = account.getBalances()
    }
    
    init(account: NSDictionary) {
        name = account["name"] as? String
        official_name = account["official_name"] as? String
        id = account["id"] as? String
        mask = account["mask"] as? String
        subType = account["subtype"] as? Int
        
        if let type = account["type"] as? Int, let _type = AccountType(rawValue: type) {
            self.type = _type
        }
        
        typeDesc = account["typeDesc"] as? String
        subTypeDesc = account["subTypeDesc"] as? String
        
        if let balances = account["balances"] as? NSDictionary {
            self.balances = AccountBalance(balances)
        }
        else {
            self.balances = AccountBalance()
        }
        
    }
    
    public func getName() -> String {
        return OptUtils.unwrap(name)
    }
    
    public func getOfficialName() -> String {
        return OptUtils.unwrap(official_name)
    }
    
    public func getId() -> String {
        return OptUtils.unwrap(id)
    }
    
    public func getType() -> AccountType {
        return type
    }
    
    public func getMask() -> String?  {
        return mask
    }
    
    public func getSubType() -> Int {
        return OptUtils.unwrap(subType)
    }
    
    public func getTypeDesc() -> String {
        return OptUtils.unwrap(typeDesc)
    }
    
    public func getSubTypeDesc() -> String {
        return OptUtils.unwrap(subTypeDesc)
    }
    
    public func getBalances() -> AccountBalance {
        return balances
    }
    
    private var name : String? 
    private var official_name : String?
    private var mask : String?
    private var id : String?
    private var type : AccountType  = AccountType.Other
    private var subType : Int?
    private var typeDesc : String?
    private var subTypeDesc : String?
    private var balances : AccountBalance
}
