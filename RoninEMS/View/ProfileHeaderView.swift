//
//  ProfileHeaderView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/13/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var model : ProfileResponse?
    var body: some View {
        VStack {
            ExtractedView(title: "Email", information: model?.user.email ?? "alvinraygonasddd@yahoo.com")
            ExtractedView(title: "Gender", information: model?.gender ?? "Female")
            ExtractedView(title: "Address", information: model?.currentAddress ?? "14 Tasdasdkjkj St Paranaque City Manila Philippines")
            ExtractedView(title: "Birthdate", information: model?.birthdate ?? "1970-01-01")
            ExtractedView(title: "Mobile number", information: model?.mobileNumber ?? "09123465781")
            ExtractedView(title: "Industry", information: model?.industry ?? "SampleDidstor")
            ExtractedView(title: "Employment status", information: model?.employmentStatus ?? "Employed")
            
            ExtractedView(title: "Healthcard", information: model?.healthCard ?? "Medicard")
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .onChange(of: self.accountVM.profileResponse) { newValue in
            model = newValue
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .previewLayout(.sizeThatFits)
            .environmentObject(AccountViewModel())
    }
}

struct ExtractedView: View {
    var title = "title"
    var information = "information@sample.com"
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(Color.ui.red)
                .padding(.top, 12)
                .frame(maxWidth: .infinity, alignment:.leading)
            Text(information)
                .font(Font.headline)
                .foregroundColor(Color.ui.textColor)
                .frame(maxWidth: .infinity,alignment:.leading)
        }
    }
}
