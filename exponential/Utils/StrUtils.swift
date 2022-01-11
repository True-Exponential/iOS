//
//  StrUtils.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StrUtils {
        
    static func showNumberWithCurrency(_ number: Int, _ currencyCode: String ) -> String {
        
        let prettyNumber = StrUtils.numberWithCommas(abs(number))
        
        var retNumber : String = ""
        
        if number < 0 {
            retNumber = "-"
        }
        
        if currencyCode == "USD" {
            retNumber += "$"
        }
        
        retNumber += prettyNumber
        
        return retNumber
    }
    
    static func numberWithCommas(_ number : Int) -> String {
        
        let numStr = String(abs(number))
        
        var characters = numStr.map { String($0) }
        characters.reverse()
        
        var retNumber = ""
        var pos = 0
        
        for character in characters {
            if (pos > 0 ) && (pos % 3 == 0) {
                retNumber += ","
            }
            
            pos += 1
            retNumber += character
        }
        
        characters = retNumber.map { String($0) }
        characters.reverse()
        
        retNumber = number < 0 ? "-" : ""
        for character in characters {
            retNumber += character
        }
                
        return retNumber
    }
}
