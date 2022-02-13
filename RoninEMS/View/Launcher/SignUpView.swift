//
//  SignUpView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import SwiftUI

struct SignUpView: View {
    @Binding var enteringLoginPage: Bool
    var body: some View {
        VStack{
            SignUpTopView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Text("Please Sign Up")
                .font(Font.custom("poppins_bold", size: 42))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("Your safety is of the essence")
                .font(Font.custom("opensans_regular", size: 14))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            if #available(iOS 15.0, *) {
                Button(action: {
                    print("sign up bin tapped")
                    UIApplication.shared.open(URL(string: Config.webviewBaseUrl.appending("/register-mobile.html"))!)
                }) {
                    Text("SIGN UP")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.accentColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                .padding()
                .cornerRadius(25)
                .tint(.accentColor)
            } else {
                // Fallback on earlier versions
                Button(action: {
                    print("sign up bin tapped")
                    UIApplication.shared.open(URL(string: Config.webviewBaseUrl.appending("/register-mobile.html"))!)
                }) {
                    Text("SIGN UP")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.accentColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                .padding()
                .cornerRadius(25)
                .background(Color.white)
            }// If you have this
                SignUpBottomView(enteringLoginPage: $enteringLoginPage)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: SignUpView(enteringLoginPage: .constant(false)).preferredColorScheme)
    }
}
