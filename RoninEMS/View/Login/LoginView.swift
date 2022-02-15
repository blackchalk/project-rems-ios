//
//  LoginView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var accountVM: AccountViewModel
    @AppStorage("accessToken") var accessToken: String = ""
    @AppStorage("isRememberMe") var isRememberMe: Bool = false
    @Binding var isAuthenticated: Bool // create a state where user is authenticated
    @State private var error: Error? = nil
    
    var body: some View {
            VStack {
                LoginTopView()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.init(top: 50, leading: 25, bottom: 8, trailing: 0))

                VStack {
                    Spacer()
                    TextField("Email", text: self.$accountVM.username)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: self.$accountVM.password)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 2)
                        )

                    Toggle(isOn: $isRememberMe) {
                        Text("Remember me")
                    }
                    .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                    Button(action: {
                        // enter login page
                        // enter login page
                        guard let url = URL.gotoForgetPasswordURL() else {
                            return
                        }
                        // enter login page
                        UIApplication.shared.open(url)
                    }){
                        Text("Forgot password?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 0))

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
                .padding(.horizontal, 25)
                // MARK - SEND BUTTON
                VStack {
                    Button(action: {
                        
                        self.accountVM.loginUser(isRememberMe: self.isRememberMe) { result in
                            switch(result) {
                            case .success(let result):
//                                    print("loginUser = \(result)")
                                DispatchQueue.main.async {
                                    self.accountVM.userID = result.users.userID
                                    self.accountVM.token = result.access_token
                                }
                            case .failure(let error):
                                print("\(error.localizedDescription)")
                            }
                        }
                        
                        isAuthenticated = true
                        
                    }) {
                        HStack(spacing: 8) {
                            Text("Log in")
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 15)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("titleTextColor"))
                    .accentColor(.primary)
                    .cornerRadius(25)
                    .padding(.horizontal,50)
                    Text(self.error?.localizedDescription ?? "")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
            }
            .onChange(of: self.isRememberMe) { newValue in
                if newValue == false {
                    UserDefaults.standard.set("", forKey: "userName") //String
                    UserDefaults.standard.set("", forKey: "password") //String
                }
            }
        }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAuthenticated: .constant(false))
    }
}
