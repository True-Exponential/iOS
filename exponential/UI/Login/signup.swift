//
//  signup.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 10/01/2022.
//  Copyright © 2022 True-Exp. All rights reserved.
//

import SwiftUI

struct Signup: View {
    
    //@State var firstName = ""
    //@State var lastName = ""
    // @State var phone = ""
    
    @State var email = ""
    @State var password = ""
    @State var checked = true
    @State var busy = false
    
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
                let nc = NotificationCenter.default
                nc.post(name: Notification.Name("UserLoggedIn"), object: nil)
            }
            else {
                
            }
        }
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
/*            TextField("First Name", text: $firstName)
                .padding(.top)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $lastName)
                .padding(.top)
                .textFieldStyle(.roundedBorder)*/
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
            
            /*TextField("Phone", text: $phone)
                .padding(.top)
                .padding(.bottom)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.phonePad)*/
            Button(action :
                    {self.loginToExponential()
            })
                   {
                       Text(Globals.userHandler.isRegistered ? "Login" : "Signup")
                           .foregroundColor(Color.white)
                           .frame(maxWidth: .infinity, alignment: .center )
                           .padding()
                           .background(self.shouldDiabled() ? Color.gray : Color.blue)
            }
                   .cornerRadius(40)
                   .disabled(self.shouldDiabled())
            
            .font(Font.system(size:15))
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
