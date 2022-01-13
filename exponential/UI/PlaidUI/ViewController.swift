//
//  ViewController.swift
//  LinkDemo-Swift
//
//  Copyright © 2019 Plaid Inc. All rights reserved.
//

import UIKit
import LinkKit


protocol LinkOAuthHandling {
    var linkHandler: Handler? { get }
}

class ViewController: UIViewController, LinkOAuthHandling {

    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var buttonContainerView: UIView!
    var linkHandler: Handler?

    // MARK: - PublicKey Configuration (Deprecated)
    // See `ViewController+PublicKey.swift` for usage of `oauthRedirectUri` & `oauthNonce`.
    // Integrating LinkKit using key has been deprecated in favor of Link Tokens
    // hence the key related oauthNonce and oauthRedirect properties are deprecated as well.
    // For more information on how to migrate to Link Tokens see https://plaid.com/docs/link/link-token-migration-guide/

    // When re-initializing Link to complete the OAuth flows ensure that the same oauthNonce is used per session.
    // This is a simplified example for demonstaration purposes only.
    let oauthNonce = UUID().uuidString

    let oauthRedirectURI =  URL(string: "https://true-exp.exponential.com/plaid/")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: Any?) {
        //presentPlaidLinkUsingLinkToken()
    }
}
