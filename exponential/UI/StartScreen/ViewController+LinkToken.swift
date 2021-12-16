//
//  ViewController+LinkToken.swift
//  LinkDemo-Swift
//
//  Copyright © 2020 Plaid Inc. All rights reserved.
//

import LinkKit

extension StartVC {
    
    func createLinkConfig(linkToken : String) -> LinkTokenConfiguration {
        
        var linkConfiguration = LinkTokenConfiguration(token: linkToken) { success in
            
            let dispatch = DispatchGroup()
            dispatch.enter()
            
            Globals.plaidHandler.getAccessToken(publicToken: success.publicToken, dispatch: dispatch)
            
            dispatch.notify(queue: .main) {
                self.getDataAndPresentUI()
            }
            
        }
        linkConfiguration.onExit = { exit in
            if let error = exit.error {
                print("exit with \(error)\n\(exit.metadata)")
            } else {
                print("exit with \(exit.metadata)")
            }
        }
        return linkConfiguration
    }
    
    func getDataAndPresentUI() {
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.plaidHandler.loadAccounts(dispatch: dispatch)
                        
        dispatch.notify(queue: .main) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainTabCtrl")
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func presentPlaidLinkUsingLinkToken() {
        
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.userHandler.login(dispatch: dispatch)
        
        dispatch.notify(queue: .main) {
            let canAccessPlaid = Globals.plaidHandler.getLinkToken().count == 0
            
            if (canAccessPlaid) {
                self.getDataAndPresentUI()
            }
            else {
                if (Globals.plaidHandler.getLinkToken().count > 0) {
                    let linkConfiguration = self.createLinkConfig(linkToken: Globals.plaidHandler.getLinkToken())
                    
                    let result = Plaid.create(linkConfiguration)
                    switch result {
                    case .failure(let error):
                        print("Unable to create Plaid handler due to: \(error)")
                    case .success(let handler):
                        handler.open(presentUsing: .viewController(self))
                        self.linkHandler = handler
                    }
                }
            }
        }
    }
}
