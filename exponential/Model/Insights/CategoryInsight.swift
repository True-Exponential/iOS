//
//  CategoryInsight.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 26/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

struct CategoryInsight :  Codable {
    init() {
        categoryId = ""
        totalSpending = 0
    }
    
    init(_ categoryInsight : NSDictionary) {
        
        categoryId = categoryInsight["categoryId"] as? String
        totalSpending = categoryInsight["totalSpending"] as? Double
    }
    
    func getCategoryId() -> String {OptUtils.unwrap(categoryId)}
    func getTotalSpending() -> Double {OptUtils.unwrap(totalSpending)}
    
    private var  categoryId : String?
    private var  totalSpending : Double?

}
