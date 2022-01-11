//
//  ViewController.swift
//  LinkDemo-Swift
//
//  Copyright © 2019 Plaid Inc. All rights reserved.
//

import UIKit
import LinkKit
import SwiftUI


class StartVC: UIViewController, LinkOAuthHandling {

    var linkHandler: Handler?
    @IBOutlet var startButton: UIButton!
    @IBOutlet var heightConstaint: NSLayoutConstraint!

    let oauthNonce = UUID().uuidString

    let oauthRedirectURI =  URL(string: "https://true-exp.exponential.com/plaid/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(userLoggedIn), name: Notification.Name("UserLoggedIn"), object: nil)
        
        self.addSwiftUIView(SwiftUIViews.signup)
    }
    
    @objc func userLoggedIn() {
        self.removeSwiftUIView()
        presentPlaidLinkUsingLinkToken()
    }
}
