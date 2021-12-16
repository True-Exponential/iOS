//
//  accounttypes.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 12/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

enum AccountType : Int, Codable{
    case Credit = 0
    case Deposit
    case Loan
    case Investment
    case Other
}
