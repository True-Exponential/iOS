//
//  account.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 12/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    
    var account: AccountEx
    
    var body: some View {
        HStack {
            Image(UIUtils.getAccountImage(account))
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(account.getName())
                    .fontWeight(.bold)
                Text("Balance: " + account.balance)
            }

            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView(account: AccountEx(
                "My Investments", AccountType.investment)
            )
                .previewLayout(.fixed(width: 300, height: 70))
            AccountView(account: AccountEx(
                "Saving", AccountType.deposit)
            )
                .previewLayout(.fixed(width: 300, height: 70))
                
        }
        
    }
}
