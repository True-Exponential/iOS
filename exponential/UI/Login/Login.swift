//
//  Login.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 09/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Text("Login To Exponential")
                .fontWeight(.bold)
            Divider().background(Color.black)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button( action:{print("Button Pressed!")},label:{Text("Login")})
                        .padding()
                    
                    Button( action:{print("Button Pressed!")},label:{Text("Signup")})
                    Spacer()
                }
                Spacer()
            }
            .background(Color.init(CoreGraphics.CGColor(red: 0.1, green: 0.9, blue: 0.9, alpha: 1)))
            
            Spacer()
        }
    }
    
    func test() {
        
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login()
        }
    }
}
