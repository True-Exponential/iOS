//
//  ViewController.swift
//  LinkDemo-Swift
//
//  Copyright © 2019 Plaid Inc. All rights reserved.
//

import UIKit
import LinkKit


class StartVC: UIViewController, LinkOAuthHandling {

    var linkHandler: Handler?
    @IBOutlet var startButton: UIButton!
    @IBOutlet var heightConstaint: NSLayoutConstraint!

    let oauthNonce = UUID().uuidString

    let oauthRedirectURI =  URL(string: "https://true-exp.exponential.com/plaid/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //presentPlaidLinkUsingLinkToken()
        
    }

    @IBAction func login(_ sender: Any?) {
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.userHandler.login(dispatch)
        
        dispatch.notify(queue: .main) {
            if (Globals.userHandler.isLoggedIn) {
                self.presentPlaidLinkUsingLinkToken()
            }
        }
    }
    
    @IBAction func signup(_ sender: Any?) {
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.userHandler.signup(dispatch)
        
        if (Globals.userHandler.isRegistered) {
            self.login(nil)
        }
    }
}
