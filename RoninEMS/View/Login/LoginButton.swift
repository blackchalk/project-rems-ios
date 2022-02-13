////
////  LoginButton.swift
////  RoninEMS
////
////  Created by Alvin Raygon on 2/10/22.
////
//
//import SwiftUI
//
//struct LoginButton: View {
////    @Environment(\.presentationMode) var presentationMode
////    @StateObject private var accountVM = AccountViewModel()
////    @Binding var loginBtnClicked : Bool
//    var body: some View {
////        Button(action: {
////            loginBtnClicked = true
//////            DispatchQueue.main.async {
//////                self.accountVM.loginUser { result in
//////                    if result {
//////                        self.presentationMode.wrappedValue.dismiss()
//////                    }
//////                }
//////            }
////        }) {
////            HStack(spacing: 8) {
////                Text("Log in")
////                    .font(.callout)
////                    .fontWeight(.bold)
////            }
////            .foregroundColor(.white)
////            .padding(.horizontal, 32)
////            .padding(.vertical, 15)
////        }
////        .frame(minWidth: 0, maxWidth: .infinity)
////        .background(Color("titleTextColor"))
////        .accentColor(.primary)
////        .cornerRadius(25)
////    }
//}
//
//struct LoginButton_Previews: PreviewProvider {
//    static var previews: some View {
////        LoginButton(loginBtnClicked: .constant(false))
////            .previewLayout(.sizeThatFits)
////        LoginButton(loginBtnClicked: .constant(false))
////            .preferredColorScheme(.dark)
////            .previewLayout(.sizeThatFits)
//    }
//}
