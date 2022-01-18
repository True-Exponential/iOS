//
//  signup.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 10/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @State var checked = true
    @State var busy = false
    @State var showError = false
    
    func shouldDiabled() -> Bool {
        busy || email.isEmpty || !Validations.validate(email :email) || password.isEmpty
    }
    
    func loginToExponential() {
        
        let dispatch = DispatchGroup()
        dispatch.enter()
        busy = true
        Globals.userHandler.login(dispatch, email, password)
        dispatch.notify(queue: .main) {
            busy = false
            if (Globals.userHandler.isLoggedIn) {
                NotificationCenter.default.post(name: Notification.Name(Messages.UserLoggedIn.rawValue), object: nil)
            }
            else {
                showError = true
            }
        }
    }
    
    func switchToSignup() {
        NotificationCenter.default.post(name: Notification.Name(Messages.SwitchToSignup.rawValue), object: nil)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image("expoicon")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Welcome")
                Text("Back,")
                    .fontWeight(.bold)
            }
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.largeTitle)
            TextField("Email Address", text: $email)
                .padding(.top)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
            
            SecureField("Choose Password", text: $password)
                .padding(.top)
                .padding(.bottom)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Button(action :
                        {self.loginToExponential()
                })
                {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center )
                        .padding()
                        .background(self.shouldDiabled() ? Color.gray : Color.blue)
                }
                .cornerRadius(40)
                .disabled(self.shouldDiabled())
                Button(action :
                        {self.switchToSignup()
                })
                {
                    Text("Not a member?")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center )
                        .padding()
                        .background(busy ? Color.gray : Color.blue)
                }
                .disabled(busy)
                .cornerRadius(40)
            }
            .font(Font.system(size:15))
            ProgressView("Please wait...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .hidden(!busy)
                .foregroundColor(.blue)
            Text("Failed to login. Please check your email and password")
                .fontWeight(.bold)
                .hidden(!showError)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.red)
            
            
            Spacer()
                .frame(maxWidth: .infinity, alignment: .center )
                .foregroundColor(Color.black)
        }
        
        .padding()
        .background(Color.white)
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
