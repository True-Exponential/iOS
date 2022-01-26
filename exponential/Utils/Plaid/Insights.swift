//
//  Insights.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 26/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

struct Insights {
    
    init() {
        
    }
    
    init(_ insights : NSDictionary) {
        
        if let categoryPurchasedTheMostTimes = insights["categoryPurchasedTheMostTimes"] as? NSDictionary {
            self.categoryPurchasedTheMostTimes = VisitInsight(categoryPurchasedTheMostTimes)
            catNamePurchasedTheMostTimes = Globals.categories.getCategoryDesc(self.categoryPurchasedTheMostTimes.getName(), nil)
        }
        
        if let businessVisitedTheMost = insights["businessVisitedTheMost"] as? NSDictionary {
            self.businessVisitedTheMost = VisitInsight(businessVisitedTheMost)
        }
        
        if let largestTransaction = insights["largestTransaction"] as? NSDictionary {
            self.largestTransaction = Transaction(largestTransaction)
        }
        
        if let categorySpentMostOn = insights["categorySpentMostOn"] as? NSDictionary {
            self.categorySpentMostOn = CategoryInsight(categorySpentMostOn)
        }
        
        if let businessSpentMostOn = insights["businessSpentMostOn"] as? NSDictionary {
            self.businessSpentMostOn = PurchaseInsight(businessSpentMostOn)
        }
        
        let categoryInsights = insights["categoryInsights"]! as? [Any] ?? []
        for _categoryInsight in categoryInsights {
            if let categoryInsight = _categoryInsight as? NSDictionary {
                self.categoryInsights.append(CategoryInsight(categoryInsight))
            }
        }
        
        let purchaseInsights = insights["purchaseInsights"]! as? [Any] ?? []
        for _purchaseInsight in purchaseInsights {
            if let purchaseInsight = _purchaseInsight as? NSDictionary {
                self.purchaseInsights.append(PurchaseInsight(purchaseInsight))
            }
        }
        
        let visitsInsights = insights["visitsInsights"]! as? [Any] ?? []
        for _visitsInsight in visitsInsights {
            if let visitsInsight = _visitsInsight as? NSDictionary {
                self.visitInsights.append(VisitInsight(visitsInsight))
            }
        }
        
        let categoryVisitsInsights = insights["categoryVisitsInsights"]! as? [Any] ?? []
        for _categoryVisitsInsight in categoryVisitsInsights {
            if let categoryVisitsInsight = _categoryVisitsInsight as? NSDictionary {
                self.categoryVisitsInsights.append(VisitInsight(categoryVisitsInsight))
            }
        }
    }
    
    func getCatNamePurchasedTheMostTimes() -> String {catNamePurchasedTheMostTimes}
    
    func getBusinessVisitedTheMost() -> VisitInsight {businessVisitedTheMost}
    func getCategoryPurchasedTheMostTimes() -> VisitInsight {categoryPurchasedTheMostTimes}
    func getLargestTransaction() -> Transaction {largestTransaction}
    func getCategorySpentMostOn() -> CategoryInsight {categorySpentMostOn}
    func getBusinessSpentMostOn() -> PurchaseInsight {businessSpentMostOn}
    
    func getCategoryInsights() -> [CategoryInsight] {categoryInsights}
    func getPurchaseInsights() -> [PurchaseInsight] {purchaseInsights}
    func getVisitInsights() -> [VisitInsight] {visitInsights}
    func getCategoryVisitsInsights() -> [VisitInsight] {categoryVisitsInsights}
    
    private var catNamePurchasedTheMostTimes = ""
    
    private var categoryPurchasedTheMostTimes = VisitInsight()
    private var businessVisitedTheMost = VisitInsight()
    private var categorySpentMostOn = CategoryInsight()
    private var largestTransaction = Transaction()
    private var businessSpentMostOn = PurchaseInsight()
    
    private var categoryInsights = [CategoryInsight]()
    private var purchaseInsights = [PurchaseInsight]()
    private var visitInsights = [VisitInsight]()
    private var categoryVisitsInsights = [VisitInsight]()
}
