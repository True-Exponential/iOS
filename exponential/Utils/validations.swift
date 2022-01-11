//
//  validations.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 11/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation

let emailPattern = #"^\S+@\S+\.\S+$"#

struct Validations {

    static func validate(email : String) -> Bool {
        let result = email.range(
            of: emailPattern,
            options: .regularExpression
        )

        return (result != nil)
    }

}

