//
//  ProfileVerifiedIndicator.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/14/22.
//

import SwiftUI

struct ProfileVerifiedIndicator: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var model : ProfileResponse?
    var body: some View {
        ZStack {
            HStack {
                if (model?.user.isVerified) != nil && model?.user.isVerified == true {
                    VStack {
                        Image(systemName:"checkmark.circle.fill")
                            .frame(maxHeight: .infinity, alignment:.leading)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Basic Level")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack{
                        Image(systemName: "checkmark.circle.fill")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Semi Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Fully Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                }else if (model?.user.isVerified) != nil
                            && (model?.user.isVerifiedHQ) != nil
                            && model?.user.isVerifiedHQ == true
                            && model?.user.isVerified == false
                {
                    VStack {
                        Image(systemName:"checkmark.circle.fill")
                            .frame(maxHeight: .infinity, alignment:.leading)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Basic Level")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack{
                        Image(systemName: "checkmark.circle.fill")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Semi Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Fully Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                }else if (model?.user.isVerified) != nil
                            && (model?.user.isVerifiedHQ) != nil
                            && model?.user.isVerifiedHQ == false
                            && model?.user.isVerified == false
                {
                    VStack {
                        Image(systemName:"checkmark.circle.fill")
                            .frame(maxHeight: .infinity, alignment:.leading)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Basic Level")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack{
                        Image(systemName: "checkmark.circle")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Semi Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 3)
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .frame(maxWidth:.infinity,alignment:.center)
                            .font(.system(size: 28))
                            .foregroundColor(Color.ui.white)
                        Text("Fully Verified")
                            .font(.footnote)
                            .foregroundColor(Color.ui.white)
                    }
                }else {
                    // else
                    ZStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 150, height: 3)
                        HStack{
                            VStack {
                                Image(systemName:"checkmark.circle.fill")
                                    .frame(alignment:.leading)
                                    .font(.system(size: 28))
                                    .foregroundColor(Color.ui.white)
                                Text("Basic Level")
                                    .font(.footnote)
                                    .padding()
                                    .foregroundColor(Color.ui.white)
                            }
                            VStack{
                                Image(systemName: "checkmark.circle")
                                    .frame(alignment:.center)
                                    .font(.system(size: 28))
                                    .foregroundColor(Color.ui.white)
                                Text("Semi Verified")
                                    .font(.footnote)
                                    .foregroundColor(Color.ui.white)
                            }
                        }
  
                    }
//                    VStack {
//                        Image(systemName:"checkmark.circle.fill")
//                            .frame(alignment:.leading)
//                            .font(.system(size: 28))
//                            .foregroundColor(Color.ui.white)
//                        Text("Basic Level")
//                            .font(.footnote)
//                            .foregroundColor(Color.ui.white)
//                    }
//                    Rectangle()
//                        .fill(Color.gray)
//                        .frame(height: 3)
//                    VStack{
//                        Image(systemName: "checkmark.circle")
//                            .frame(alignment:.center)
//                            .font(.system(size: 28))
//                            .foregroundColor(Color.ui.white)
//                        Text("Semi Verified")
//                            .font(.footnote)
//                            .foregroundColor(Color.ui.white)
//                    }
//                    Rectangle()
//                        .fill(Color.gray)
//                        .frame(height: 3)
//                    VStack {
//                        Image(systemName: "checkmark.circle")
//                            .frame(maxWidth:.infinity,alignment:.center)
//                            .font(.system(size: 28))
//                            .foregroundColor(Color.ui.white)
//                        Text("Fully Verified")
//                            .font(.footnote)
//                            .foregroundColor(Color.ui.white)
//                    }
                }
            }
            .background(Color.ui.red)
        }
        .onChange(of: self.accountVM.profileResponse) { newValue in
            model = newValue
        }
    }
}

struct ProfileVerifiedIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProfileVerifiedIndicator()
            .environmentObject(AccountViewModel())
            .previewLayout(.sizeThatFits)
    }
}
