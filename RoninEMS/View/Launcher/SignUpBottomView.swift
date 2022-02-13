//
//  SignUpBottom.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import SwiftUI

struct SignUpBottomView : View {
    @Binding var enteringLoginPage: Bool
    var body: some View {
        VStack(spacing:20) {
            HStack {
                Text("Already have an account? ")
                Button(action: {
                    enteringLoginPage = true
                }){
                    Text("Login")
                        .foregroundColor(Color.red)
                }
            }
            Button(action: {
                // enter login page
                UIApplication.shared.open(URL(string: Config.webviewBaseUrl.appending("/privacy-policy.html"))!)
            }){
                Text("Privacy Policy")
                    .foregroundColor(Color.red)
            }
            .padding(.bottom)
        }
    }
}

struct SignUpBottomView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpBottomView(enteringLoginPage: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
