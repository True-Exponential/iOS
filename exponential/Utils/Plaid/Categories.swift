//
//  Categories.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 29/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct Categories {
    
    init() {}
    
    init(categories : [Category]) {
        for category in categories {
            self.categories[category.getId()] = category
        }
    }
    
    init(json : [String: Any]?) {
    
        self.categories = [String: Category]()
        
        if (json != nil) {
            let categories = json!["categories"]! as? Array<Any>
            if (categories != nil) {
                for category in categories! {
                    let newCategory = Category(category: category as! NSDictionary)
                    self.categories[newCategory.getId()] = newCategory
                }
            }
        }
    }
    
    func get(id : String) -> Category {
        let category = categories[id]
        
        if (category == nil) {
            return Category()
        }
        
        return category!
    }
    
    var categories = [String: Category]()
    
}
