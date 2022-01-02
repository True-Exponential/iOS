import UIKit
import SwiftUI

@available(iOS 13.0, *)
extension StartVC {
    func presentSwiftUILinkToken() {
        let dispatch = DispatchGroup()
    
        dispatch.enter()
        
        Globals.plaidHandler.getLinkToken(dispatch)
        
        dispatch.notify(queue: .main) {
            let configuration = self.createLinkConfig(linkToken: Globals.plaidHandler.getLinkToken())
            self.presentLink(with: .linkToken(configuration))
        }
    }
    
    func presentSwiftUIPublicKey() {
        let configuration = createPublicKeyConfiguration()
        presentLink(with: .publicKey(configuration))
    }
    
    private func presentLink(with linkConfiguration: LinkController.LinkConfigurationType) {
        let contentView = LinkController(configuration: linkConfiguration, openOptions: [:]) { (error) in
            print("Handle error: \(error)!")
        }
        let vc = UIHostingController(rootView: contentView)
        present(vc, animated: true, completion: nil)
    }
}

