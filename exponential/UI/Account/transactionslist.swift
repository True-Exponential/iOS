//
//  transactionslist.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct TransactionsList: View {
    
    @State var transactions = [TransactionEx]()
    
    var account : AccountEx
    
    init(account : AccountEx) {
        self.account = account
        self.transactions = account.getTransactions()
    }
    
    var body: some View {
        List(self.transactions) { transaction in
            NavigationLink {
                TransactionsList(account: account)
            } label: {
                TransactionView(transacton: transaction)
            }
        }
        .navigationTitle(account.getName())
        .navigationBarTitleDisplayMode(.inline)
        .task {
            if(account.getTransactions().count != 0) {
                self.transactions = account.getTransactions()
            }
            else {
                let dispatch = DispatchGroup()
                dispatch.enter()
                
                Globals.plaidHandler.loadTransactions(dispatch, [account.getId()])
                
                dispatch.notify(queue: .main) {
                    self.transactions = account.getTransactions()
                }
            }
        }
    }
}

struct TransactionsList_Previews: PreviewProvider {
    
    init() {
        let dispatch = DispatchGroup()
        dispatch.enter()
        
        Globals.plaidHandler.loadAccounts(dispatch)
    }
    
    static var previews: some View {
        TransactionsList(account: Globals.accounts.getSortedAccounts()[0])
    }
}
