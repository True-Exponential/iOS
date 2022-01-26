//
//  TransactionView.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 13/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

//
struct TransactionView: View {
    
    var transacton: TransactionEx
    
    var body: some View {
        HStack {
            Image(UIUtils.getTransactionImage(transacton))
                .resizable()
                .frame(width: 20, height: 20)
            VStack(alignment: .leading) {
                Text(transacton.getName())
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Date: " + transacton.getDate())
                    .font(Font.system(size:15))
                //Text("Date: " + transacton.categoryDesc)
                  //  .font(Font.system(size:15))
            }
            Spacer()
            Text(transacton.ammount)

//            Spacer()
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionView(transacton: TransactionEx(
                "Trans1", "18020007", 100,"")
            )
                .previewLayout(.fixed(width: 300, height: 70))
            TransactionView(transacton: TransactionEx(
                "Trans2", "18020009", 100,"")
            )
                .previewLayout(.fixed(width: 300, height: 70))
                
        }
        
    }
}
