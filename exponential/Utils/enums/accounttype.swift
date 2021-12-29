//
//  accounttypes.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 12/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

enum AccountType : Int, Codable{
    case Deposit = 0
    case Credit
    case Loan
    case Investment
    case Brokerage
    case Other
} 
