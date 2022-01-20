//
//  AccountsList.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct AccountsList: View {
    
    @State private var actionState: Int = 0
    
    init() {
        if (Globals.demoMode && (Globals.accounts.count == 0)) {
            let dispatch = DispatchGroup()
            dispatch.enter()
            
            Globals.plaidHandler.loadAccounts(dispatch)
            dispatch.enter()
            Globals.plaidHandler.loadCategories(dispatch)
        }
    }
    
    var body: some View {
        NavigationView {
            List(Globals.accounts.getSortedAccounts()) { accountEx in
                NavigationLink {
                    TransactionsList(account:accountEx)
                }
                label: {
                    AccountView(account: accountEx)
                }
            }
            .navigationTitle("Your Accounts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountsList_Previews: PreviewProvider {
    
    init() {
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.plaidHandler.loadAccounts(dispatch)
    }
    
    static var previews: some View {
        
        AccountsList()
    }
}
