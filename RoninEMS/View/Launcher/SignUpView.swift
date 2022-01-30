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
            Button(action: {
                    print("sign up bin tapped")
                UIApplication.shared.open(URL(string: "https://appspcs.vstecs.com.ph/register-mobile.html")!)
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
                .background(Color.white) // If you have this
                .cornerRadius(25)
                SignUpBottomView(enteringLoginPage: $enteringLoginPage)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(enteringLoginPage: .constant(false))
    }
}
