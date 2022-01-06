//
//  NumUtils.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct OptUtils {
    static func unwrap(_ value : Int?) -> Int {value ?? 0}
    static func unwrap(_ value : String?) -> String {value ?? ""}
    static func unwrap(_ value : Bool?) -> Bool {value ?? false}
    static func unwrap(_ value : Double?) -> Double {value ?? 0}
}
