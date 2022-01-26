//
//  Categories.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 29/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Categories {
    
    init() {}
    
    init(_ categories : [Category]) {
        for category in categories {
            self[category.getId()] = category
        }
    }
    
    init(_ json : [String: Any]?) {
    
        self.categories = [String: Category]()
        
        if let data = json {
            let categories = data["categories"]! as? [Any] ?? []
            for _category in categories {
                if let category = _category as? NSDictionary {
                    let newCategory = Category(category as NSDictionary)
                    self[newCategory.getId()] = newCategory
                }
            }
        }
    }
    
    subscript (_ id : String) -> Category {
        get {
            if let category = categories[id] {
            return category
            }
            
            return Category()
        }
        
        set {
            categories[id] = newValue
        }
    }
    
    func getCategoryDesc(_ id : String,_ altCategories : [String]?) -> String {
        let category = self[id]
        
        var hierarchy = category.getHierarchy()
        
        if hierarchy.isEmpty {
            hierarchy = altCategories ?? []
        }
            
        if hierarchy.count > 0 {
            return hierarchy[0]
        }
        
        return ""
    }
    
    var categories = [String: Category]()
    
}
