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
        
        if let dayShoppedTheMost = insights["dayShoppedTheMost"] as? NSDictionary {
            self.dayShoppedTheMost = VisitInsight(dayShoppedTheMost)
        }
        
        if let monthShoppedTheMost = insights["monthShoppedTheMost"] as? NSDictionary {
            self.monthShoppedTheMost = VisitInsight(monthShoppedTheMost)
        }
        
        if let daySpentTheMost = insights["daySpentTheMost"] as? NSDictionary {
            self.daySpentTheMost = PurchaseInsight(daySpentTheMost)
        }
        
        if let monthSpentTheMost = insights["monthSpentTheMost"] as? NSDictionary {
            self.monthSpentTheMost = PurchaseInsight(monthSpentTheMost)
        }
        
        let categoryInsights = insights["categoryInsights"]! as? [Any] ?? []
        for _categoryInsight in categoryInsights {
            if let categoryInsight = _categoryInsight as? NSDictionary {
                self.categoryInsights.append(CategoryInsight(categoryInsight))
            }
        }
        
        self.purchaseInsights = populatePurchasesInsight(insights,"purchaseInsights")
        self.purchaseDayInsights = populatePurchasesInsight(insights,"purchaseDayInsights")
        self.purchaseMonthInsights = populatePurchasesInsight(insights,"purchaseMonthInsights")
        
        self.visitInsights = populateVisitsInsight(insights,"visitsInsights")
        self.categoryVisitsInsights = populateVisitsInsight(insights,"categoryVisitsInsights")
        self.dayVisitInsights = populateVisitsInsight(insights,"visitDaysInsights")
        self.monthVisitInsights = populateVisitsInsight(insights,"visitMonthsInsights")
    }
    
    private func populateVisitsInsight(_ insights : NSDictionary,_ key : String) -> [VisitInsight]{
        
        var insightsArray = [VisitInsight]()
        
        let _insights = insights[key]! as? [Any] ?? []
        for insightDic in _insights {
            if let insight = insightDic as? NSDictionary {
                insightsArray.append(VisitInsight(insight))
            }
        }
        
        return insightsArray
    }
    
    private func populatePurchasesInsight(_ insights : NSDictionary,_ key : String) -> [PurchaseInsight]{
        
        var insightsArray = [PurchaseInsight]()
        
        let _insights = insights[key]! as? [Any] ?? []
        for insightDic in _insights {
            if let insight = insightDic as? NSDictionary {
                insightsArray.append(PurchaseInsight(insight))
            }
        }
        
        return insightsArray
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
    
    func getDayVisitInsights() -> [VisitInsight] {dayVisitInsights}
    func getMonthVisitInsights() -> [VisitInsight] {monthVisitInsights}
    
    func getPurchaseDayInsights() -> [PurchaseInsight] {purchaseDayInsights}
    func getPurchaseMonthInsights() -> [PurchaseInsight] {purchaseMonthInsights}
    
    func getDayShoppedTheMost() -> VisitInsight {dayShoppedTheMost}
    func getMonthShoppedTheMost() -> VisitInsight {monthShoppedTheMost}
    
    func getDaySpentTheMost() -> PurchaseInsight {daySpentTheMost}
    func getMonthSpentTheMost() -> PurchaseInsight {monthSpentTheMost}
    
    
    private var catNamePurchasedTheMostTimes = ""
    
    private var categoryPurchasedTheMostTimes = VisitInsight()
    private var businessVisitedTheMost = VisitInsight()
    private var categorySpentMostOn = CategoryInsight()
    private var largestTransaction = Transaction()
    private var businessSpentMostOn = PurchaseInsight()
    
    private var daySpentTheMost = PurchaseInsight()
    private var monthSpentTheMost = PurchaseInsight()
    
    private var dayShoppedTheMost = VisitInsight()
    private var monthShoppedTheMost = VisitInsight()
        
    private var categoryInsights = [CategoryInsight]()
    private var purchaseInsights = [PurchaseInsight]()
    private var visitInsights = [VisitInsight]()
    private var categoryVisitsInsights = [VisitInsight]()
    
    private var dayVisitInsights = [VisitInsight]()
    private var monthVisitInsights = [VisitInsight]()
    
    private var purchaseDayInsights = [PurchaseInsight]()
    private var purchaseMonthInsights = [PurchaseInsight]()
}
