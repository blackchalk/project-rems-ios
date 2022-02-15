//
//  ProfileHeaderNameView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/14/22.
//

import SwiftUI

struct ProfileHeaderNameView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var model : ProfileResponse?
    @State private var fullName: String = "--"
    @State private var packageName = "--"
    var body: some View {
        VStack {
            Spacer()
            VStack{
                Text(fullName)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(model?.customerGroup.customerGroupName ?? "--")
                    .frame(maxWidth: .infinity,alignment: .leading)
            }.frame(maxWidth: .infinity,alignment: .top)
            Spacer()
            VStack{
                Text("Subscrition Type")
                    .font(Font.footnote)
                    .frame(maxWidth: .infinity,alignment: .center)
                Text(packageName)
                    .font(Font.title)
                    .frame(maxWidth: .infinity,alignment: .center)
                Button(action: {
                    
                }, label: {
                    Text("Enter Activation Code")
                })
                    .frame(maxWidth: .infinity,alignment: .bottomTrailing)
                    .hidden()
            }.frame(maxWidth: .infinity,alignment: .bottom)
        }
        .background(Color.ui.red)
        .foregroundColor(Color.ui.white)
        .onChange(of: self.accountVM.profileResponse) { newValue in
            model = newValue
            self.fullName = generateFullName()
        }
        .onChange(of: self.accountVM.profileLicensedDetailsResponse) { newValue in
            self.packageName = newValue?.results.activePackage.packageName ?? "--"
        }
    }
}

extension ProfileHeaderNameView {
    private func generateFullName() -> String {
        var fullName = self.model?.user?.firstName ?? "--"
        fullName = fullName + " "
        fullName = fullName + (self.model?.user?.lastName)!
        return fullName
    }
}

struct ProfileHeaderNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderNameView()
            .environmentObject(AccountViewModel())
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
