//
//  signup.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 10/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct Signup: View {
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var email = ""
    @State var password = ""
    @State var checked = true
    @State var busy = false
    @State var showError = false
    
    func shouldDiabled() -> Bool {
        busy || email.isEmpty || !Validations.validate(email :email) || password.isEmpty
    }
    
    func signupToExponential() {
        
        let dispatch = DispatchGroup()
        dispatch.enter()
        busy = true
        Globals.userHandler.signup(dispatch, email, password,firstName,lastName)
        dispatch.notify(queue: .main) {
            busy = false
            if (Globals.userHandler.isLoggedIn && Globals.userHandler.isRegistered) {
                NotificationCenter.default.post(name: Notification.Name(Messages.UserLoggedIn.rawValue), object: nil)
            }
            else {
                if (Globals.userHandler.isRegistered) {
                    NotificationCenter.default.post(name: Notification.Name(Messages.SwitchToLogin.rawValue), object: nil)
                }
                else {
                    showError = true
                }
            }
        }
}

func switchToLogin() {
    NotificationCenter.default.post(name: Notification.Name(Messages.SwitchToLogin.rawValue), object: nil)
}

var body: some View {
    VStack(alignment: .center) {
        Image("expoicon")
            .frame(maxWidth: .infinity, alignment: .leading)
        HStack {
            Text("Hello")
            Text("There,")
                .fontWeight(.bold)
        }
        .foregroundColor(Color.black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.largeTitle)
        Text("Enter the information below to be part of something exclusive")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            .foregroundColor(Color.black)
        Group {
            TextField("First Name (optional)", text: $firstName)
                .padding(.top)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name (optional)", text: $lastName)
                .padding(.top)
                .textFieldStyle(.roundedBorder)
        }
        TextField("Email Address", text: $email)
            .padding(.top)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .keyboardType(.emailAddress)
        
        SecureField("Choose Password", text: $password)
            .padding(.top)
            .padding(.bottom)
            .textFieldStyle(.roundedBorder)
        
        /*HStack {
         CheckBoxView(checked: $checked)
         Text("Accept Agreement:")
         }*/
        
        
        HStack {
            Button(action :
                    {self.signupToExponential()
            })
            {
                Text("Signup")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .center )
                    .padding()
                    .background(self.shouldDiabled() ? Color.gray : Color.blue)
            }
            .cornerRadius(40)
            .disabled(self.shouldDiabled())
            Button(action :
                    {self.switchToLogin()
            })
            {
                Text("Already a member?")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .center )
                    .padding()
                    .background(busy ? Color.gray : Color.blue)
            }
            .cornerRadius(40)
            .disabled(busy)
        }
        .font(Font.system(size:15))
        Group {
            ProgressView("Please wait...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .hidden(!busy)
                .foregroundColor(.blue)
            
            Text("Failed to register your account. Are you already a member?")
                .fontWeight(.bold)
                .hidden(!showError)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.red)
        }
        
        Spacer()
        VStack {
            Text("By creating an account you agree to our")
            HStack {
                Text("Terms & Conditons")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Text("and")
                Text("Privacy Policy")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center )
        .foregroundColor(Color.black)
    }
    
    .padding()
    .background(Color.white)
}
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
