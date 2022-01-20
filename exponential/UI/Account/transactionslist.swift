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
    
    func sortListDate() {
        self.transactions = account.getTransactions(SortType.date)
        }
    
    func sortListCategories() {
        self.transactions = account.getTransactions(SortType.categories)
        }
    
    func sortListAmount() {
        self.transactions = account.getTransactions(SortType.amount)
        }
    
    var body: some View {
        ProgressView("Please wait...")
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .hidden(!busy)
            .foregroundColor(.blue)
        Menu("Sort By") {
            Button(SortType.date.rawValue, action: sortListDate)
                Button(SortType.categories.rawValue, action: sortListCategories)
                Button(SortType.amount.rawValue, action: sortListAmount)
            }
        .hidden(busy)
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
