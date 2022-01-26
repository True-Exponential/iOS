//
//  StrUtils.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 06/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import Foundation

struct StrUtils {
        
    static func showNumberWithCurrency(_ number: Double, _ currencyCode: String ) -> String {
        
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
    
    static func getMonth(_ dateStr : String) -> Int {
        let dateArray = dateStr.components(separatedBy: "-")
        
        if (dateArray.count == 3) {
            return Int(dateArray[1]) ?? 0
        }
        
        return 0
    }
    
    static func numberWithCommas(_ number : Double) -> String {
        
        var remainder = number.truncatingRemainder(dividingBy: 1)
        remainder *= 100
        remainder -= remainder.truncatingRemainder(dividingBy: 1)
        remainder /= 100
        
        let intNum = Int(number)
        
        let numStr = String(abs(intNum))
        
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
        
        if (remainder >= 0.01) {
            var strReminder = String(remainder)
            
            let range = strReminder.index(after: strReminder.startIndex)..<strReminder.endIndex
            strReminder = String(strReminder[range])
            
            retNumber += strReminder
        }
                
        return retNumber
    }
}
