//
//  globals.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 28/11/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Globals {
    static private let serverAddress = "http://localhost:8080"
    
    static let plaidHandler = PlaidHandler()
    static let plaidMode = true;
    
    public static func getServerAddr() -> String {return Globals.serverAddress;}
}
