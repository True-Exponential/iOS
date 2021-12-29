//
//  category.swift
//  LinkDemo-Swift
//
//  Created by Judas Macab on 29/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

class Category : Codable {
    
    init() {
        category_id = ""
        group  = ""
        hierarchy  = [""]
    }
    
    init(category : Category) {
        category_id = category.getId()
        group  = category.getGroup()
        hierarchy  = category.getHierarchy()
    }
    
    init(category: NSDictionary) {
        category_id = category["category_id"] as? String
        group = category["group"] as? String
        hierarchy = category["hierarchy"] as? [String]
    }
    
    public func getId() -> String {
        return StrUtils.unwrapString(value: category_id);
    }
    
    public func getGroup() -> String {
        return StrUtils.unwrapString(value: group);
    }
    
    public func getHierarchy() -> [String] {
        if let _hierarchy = hierarchy {
            return _hierarchy
        }
        
        return []
    }
    
    private var category_id : String?
    private var group :String?
    private var hierarchy : [String]?
}
