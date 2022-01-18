//
//  viewex.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 18/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

