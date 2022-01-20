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
    @State var busy = true
    
    var account : AccountEx
    
    init(account : AccountEx) {
        self.account = account
        self.transactions = account.getTransactions()
    }
    
    func sortList() {
        
    }
    
    var body: some View {
        ProgressView("Please wait...")
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .hidden(!busy)
            .foregroundColor(.blue)
        Menu("Sort By") {
                Button("Date", action: sortList)
                Button("Categories", action: sortList)
                Button("Ammount", action: sortList)
            }
        .menuStyle(.borderlessButton)
        List(self.transactions) { transaction in
            NavigationLink {
                TransactionsList(account: account)
            } label: {
                TransactionView(transacton: transaction)
            }
        }
        .hidden(busy)
        .navigationTitle(account.getName())
        .navigationBarTitleDisplayMode(.inline)
        .task {
            if(account.getTransactions().count != 0) {
                busy = false
                self.transactions = account.getTransactions()
            }
            else {
                let dispatch = DispatchGroup()
                dispatch.enter()
                
                Globals.plaidHandler.loadTransactions(dispatch, [account.getId()])
                
                dispatch.notify(queue: .main) {
                    busy = false
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
