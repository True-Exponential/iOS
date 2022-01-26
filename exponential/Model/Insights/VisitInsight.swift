//
//  VisitInsight.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 26/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

struct VisitInsight :  Codable {
    
    init() {
        name = ""
        totalVisits = 0
    }
    
    init(_ visitInsight : NSDictionary) {
        
        name = visitInsight["name"] as? String
        totalVisits = visitInsight["totalVisits"] as? Int
    }
    
    func getName() -> String {OptUtils.unwrap(name)}
    func getVisits() -> Int {OptUtils.unwrap(totalVisits)}
    
    private var  name : String?
    private var  totalVisits : Int?
}
