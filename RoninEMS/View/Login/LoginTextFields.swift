//
//  LoginBottomView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/10/22.
//

import SwiftUI

struct LoginTextFields: View {

    @ObservedObject private var accountVM = AccountViewModel()
    @State private var isRememberMe = false
    
    var body: some View {
        VStack(alignment: .leading) {
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
                UIApplication.shared.open(URL(string: Config.webviewBaseUrl.appending("/privacy-policy.html"))!)
            }){
                Text("Forgot password?")
            }
            .frame(maxHeight: .none)
            .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
        }
    }
}

struct LoginBottomView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFields()
            .previewLayout(.sizeThatFits)
    }
}
