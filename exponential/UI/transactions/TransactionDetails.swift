//
//  TransactionDetails.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 25/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct TransactionLine : View {
    
    let caption: String
    let info : String
    
    var body: some View {
        HStack {
            Text(caption)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            Text(info)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(10)
    }
}

struct TransactionDetails: View {
    
    var transaction : TransactionEx
    var account : AccountEx
    
    var body: some View {
        VStack {
            TransactionLine(caption: "Mechant Name:", info: transaction.getName())
            TransactionLine(caption: "Ammount:", info: transaction.ammount)
            TransactionLine(caption: "Date:", info: transaction.getAuthorizedDate())
            TransactionLine(caption: "Category:", info: transaction.categoryDesc)
            TransactionLine(caption: "Total Transactions:", info: String(account.totalTransactionsByCategory(transaction.getCategoryId())))
            TransactionLine(caption: "Total Spending:", info: account.totalSpendingByCategory(transaction.getCategoryId()))
            Spacer()
        }
    }
}

struct TransactionDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        let transaction = TransactionEx(
            "Bed, Bath & Beyobd", "18020007", 100, "2022-12-03")
        
        TransactionDetails(transaction: transaction, account : AccountEx(
            "Saving", AccountType.deposit))
    }
}
