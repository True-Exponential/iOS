//
//  swiftuibridge.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 09/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum SwiftUIViews {
    case login
    case signup
}

var addedVC : UIViewController?

extension UIViewController {
    
    func addSwiftUIView(_ viewType : SwiftUIViews) {
        
        switch(viewType) {
        case .login:
            self.addSwiftUIViewInt(UIHostingController(rootView:Login()))
            
        case .signup:
            self.addSwiftUIViewInt(UIHostingController(rootView:Signup()))
        }
    }
    
    func removeSwiftUIView() {
        if let _addedVC = addedVC {
            _addedVC.view.removeFromSuperview()
        }
    }
    
    private func addSwiftUIViewInt(_ hostingController : Any) {
        
        let vc = hostingController as! UIViewController
        addChild(vc)
        
        addedVC = vc
        
        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(vc.view)
        
        /// Setup the constraints to update the SwiftUI view boundaries.
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            vc.view.topAnchor.constraint(equalTo: view.topAnchor),
            vc.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: vc.view.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        /// Notify the hosting controller that it has been moved to the current view controller.
        vc.didMove(toParent: self)
    }
    
}

