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
                       })
                    .frame(alignment: .center)
                    .padding()
               } else {
                   // Fallback on earlier versions
                   Image(systemName: "person.fill.questionmark")
                       .resizable()
                       .scaledToFit()
                       .frame(maxWidth: 300, maxHeight: 400,alignment: .center)
                       .padding()

               }
            // verify no button l subscription type
            Button(action: {
                print("sign up bin tapped")
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
            .cornerRadius(25)
            .frame(maxWidth: 150, maxHeight: 50,alignment: .center)
        }
        .onChange(of: accountVM.profileResponse) { newValue in
            profilePhoto = newValue?.profilePic ?? ""
        }
    }
}

struct ProfileHeaderVerifyNow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderVerifyNow()
            .environmentObject(AccountViewModel())
            .previewLayout(.sizeThatFits)
    }
}
