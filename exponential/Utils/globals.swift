//
//  globals.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 28/11/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Globals {
    static private let serverAddress = "http://localhost:8080"
    
    static let demoMode = false
    
    static let plaidHandler : Finance = demoMode ? PlaidDemoHandler() : PlaidHandler()
    
    static var userHandler = UserHandler()
    
    static var categories = Categories()
    static var accounts = Accounts()
    static var transactions = Transactions()
    static var securities = Securities()
    static var holdings = Holdings()
    static var liablities = Liablities()
    
    public static func getServerAddr() -> String {Globals.serverAddress}
}
