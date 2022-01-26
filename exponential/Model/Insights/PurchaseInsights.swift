//
//  PurchaseInsights.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 26/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

struct PurchaseInsight {
    init() {
        businessName = ""
        totalSpending = 0
    }
    
    init(_ visitInsight : NSDictionary) {
        
        businessName = visitInsight["businessName"] as? String
        totalSpending = visitInsight["totalVisits"] as? Double
    }
    
    func getBusinessName() -> String {OptUtils.unwrap(businessName)}
    func getTotalSpending() -> Double {OptUtils.unwrap(totalSpending)}
    
    private var  businessName : String?
    private var  totalSpending : Double?
}
