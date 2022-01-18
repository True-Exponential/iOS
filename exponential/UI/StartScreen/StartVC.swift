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
        nc.addObserver(self, selector: #selector(userLoggedIn), name: Notification.Name(Messages.UserLoggedIn.rawValue), object: nil)
        nc.addObserver(self, selector: #selector(SwitchToLogin), name: Notification.Name(Messages.SwitchToLogin.rawValue), object: nil)
        nc.addObserver(self, selector: #selector(SwitchToSignup), name: Notification.Name(Messages.SwitchToSignup.rawValue), object: nil)
        
        if (Globals.userHandler.isRegistered) {
            self.addSwiftUIView(SwiftUIViews.login)
        }
        else {
            self.addSwiftUIView(SwiftUIViews.signup)
        }
        
    }
    
    @objc func userLoggedIn() {
        self.removeSwiftUIView()
        presentPlaidLinkUsingLinkToken()
    }
    
    @objc func SwitchToLogin() {
        self.removeSwiftUIView()
        self.addSwiftUIView(SwiftUIViews.login)
    }
    
    @objc func SwitchToSignup() {
        self.removeSwiftUIView()
        self.addSwiftUIView(SwiftUIViews.signup)
    }
    
}
