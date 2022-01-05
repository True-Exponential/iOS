//
//  accounttypes.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 12/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

enum AccountType : Int, Codable{
    case deposit
    case credit
    case loan
    case investment
    case brokerage
    case other
} 
