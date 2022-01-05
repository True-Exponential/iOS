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
            self.categories[category.getId()] = category
        }
    }
    
    init(_ json : [String: Any]?) {
    
        self.categories = [String: Category]()
        
        if let data = json {
            let categories = data["categories"]! as? [Any] ?? []
            for category in categories {
                let newCategory = Category(category: category as! NSDictionary)
                self.categories[newCategory.getId()] = newCategory
            }
        }
    }
    
    subscript (_ id : String) -> Category {
        if let category = categories[id] {
            return category
        }
        
        return Category()
    }
    
    var categories = [String: Category]()
    
}
