//
//  Profile.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("accessToken") var accessToken: String = ""
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var profileData: ProfileResponse?
    var body: some View {
        VStack {
            VStack{
//                // MARK: - PROFILE HEADER
                // EDIT PROFILE
                HStack {
                    Spacer()
                    Button(action: {
                        // go to edit profile sheet
                    }, label: {
                        Text("Edit Profile")
                            .font(Font.custom("opensans_bold", size: 22))
                            .foregroundColor(.white)
                            .frame(alignment: .topTrailing)
                            .padding()
                    })
                }
                HStack{
                    ProfileHeaderVerifyNow()
                    ProfileHeaderNameView()
                        .padding()
                }
                ProfileHeaderVerificationTest()
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity,alignment: .center)
            .background(Color.ui.red)
            .onAppear(perform: {
                // fetch profile
                self.accountVM.getProfile() { result in
                    guard let result = result as? ProfileResponse, ((result as? NetworkError) != nil) else {
                        return
                    }
                }
            })
            .onChange(of: self.accountVM.profileResponse) { newValue in
                if let newValue = newValue {
                    profileData = newValue
                }
            }
            VStack {
                ScrollView{
                    VStack{
                        ProfileHeaderView()
                            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center)
                            .padding(.leading, 50)
                            .padding(.trailing, 50)
                            .padding(.bottom, 25)
                        ProfileInformationView()
                            .padding(.bottom, 25)
                            .frame(maxWidth:.infinity,alignment:.bottom)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AccountViewModel())
    }
}
