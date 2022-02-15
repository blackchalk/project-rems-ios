//
//  ProfileHeaderVerifyNow.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/14/22.
//

import SwiftUI

struct ProfileHeaderVerifyNow: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var profilePhoto: String = "person.fill"
    @State private var showingAlert = false
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                   AsyncImage(
                    url: URL(string: profilePhoto),
                       content: { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                       }, placeholder: {
                           Image(systemName: "person.fill")
                               .resizable()
                               .scaledToFit()
                               .foregroundColor(Color.ui.white)
                       })
                    .frame(maxWidth: 234, maxHeight: 300,alignment: .center)
               } else {
                   // Fallback on earlier versions
                   Image(systemName: "person.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(maxWidth: 164, maxHeight: 150,alignment: .center)
                       .foregroundColor(Color.ui.white)

               }
            // verify button hides when profile is present
//            if accountVM.profileResponse != nil {
                if #available(iOS 15.0, *) {
                    Button(action: {
                        print("verify now tapped")
                        showingAlert = true
                    }) {
                        Text("Verify Now")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color.ui.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .background(Color.white)
                    }
                    .alert("Not yet available", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .cornerRadius(25)
                    .frame(maxWidth: 148, maxHeight: 48, alignment: .center)
                } else {
                    // Fallback on earlier versions
                    Button(action: {
                        print("verify now tapped")
                        showingAlert = true
                    }) {
                        Text("Verify Now")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color.ui.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .background(Color.white)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Alert"),
                            message: Text("Not yet available"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .cornerRadius(25)
                    .frame(maxWidth: 148, maxHeight: 48, alignment: .center)
                }
//            }
        }
        .onChange(of: accountVM.profileResponse) { newValue in
            profilePhoto = newValue?.profilePic ?? ""
        }
    }
}

struct ProfileHeaderVerifyNow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderVerifyNow()
            .previewLayout(.sizeThatFits)
            .environmentObject(AccountViewModel())
            .background(Color.red)
    }
}
