//
//  ProfileHeaderVerificationTest.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/14/22.
//

import SwiftUI

struct ProfileHeaderVerificationTest: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @State private var model : ProfileResponse?
    @State private var verify: Int = 3
    private var verificationLevels: [String] = ["Fully Verified","Semi Verified", "Basic Level"]
    
    var body: some View {
        VStack{
            HStack(spacing: 1){
                ForEach((1...3).reversed(), id: \.self) {
                    let label = verificationLevels[$0 - 1]
                    ContentCellView(
                        isLast: $0 == 1,
                        statusLabel: label,
                        currentCount: $0,
                        verifyIndicator: verify
                    ) // isLast for not showing last line in last cell
                }
            }
        }
        .onChange(of: accountVM.profileResponse, perform: { newValue in
            model = newValue
            verify = setVerificationStatus(isVerified: model?.user?.isVerified ?? false, isVerifiedHQ: model?.user?.isVerifiedHQ ?? false)
        })
        .padding()
    }
}

extension ProfileHeaderVerificationTest {
    func setVerificationStatus(isVerified: Bool, isVerifiedHQ: Bool) -> Int{
        
        if isVerifiedHQ && isVerified {
            return 3
        }else if isVerifiedHQ || isVerified {
            return 2
        }else {
            return 1
        }
    }
}

enum VerifyStatus: String {
    case basic
    case semi
    case full
}

//https://stackoverflow.com/a/65222200/5152102
// Content HStack cell view
struct ContentCellView: View {
    var isLast: Bool = false
    var statusLabel = "Basic Level"
//    @State private var status : VerifyStatus
//    @State private var currentCount: Int = 4 // first item being counted is the last item(3)
    var currentCount = 3
    var verifyIndicator: Int = 3 // private instance
    
    var body: some View {
        ZStack {
            HStack(alignment: VerticalAlignment.center, spacing: 0) {
                VStack {
                    // BASIC
                    if currentCount == 3  {
                        Image(systemName:"checkmark.circle.fill").frame(maxWidth:.infinity, maxHeight: 32).imageScale(.large).foregroundColor(Color.ui.white)
                    }
                    
                    if (currentCount > 2 && verifyIndicator > 3)
                        || (currentCount != 3 && verifyIndicator == 2 && currentCount == 1)
                        || (currentCount != 3 && verifyIndicator == 1) {
                        Image(systemName:"checkmark.circle").frame(maxWidth:.infinity, maxHeight: 32).imageScale(.large).foregroundColor(Color.ui.white)
                    }
                    
                    // SEMI
                    if (currentCount == 2 && verifyIndicator == 2 && verifyIndicator != 1)
                        || (verifyIndicator == 3 && currentCount != 3) {
                        Image(systemName:"checkmark.circle.fill").frame(maxWidth:.infinity, maxHeight: 32).imageScale(.large).foregroundColor(Color.ui.white)
                    }
                    
                    Text(statusLabel).frame(width: 102)
                        .font(Font.custom("opensans_regular",size: 16))
                        .foregroundColor(Color.ui.white)
                }
            }
            if !isLast {
                Rectangle().fill(Color.ui.white).frame(maxWidth: 100, maxHeight: 2).offset(x: 60,y: -15)
            }
        }
    }
}

struct ProfileHeaderVerificationTest_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderVerificationTest()
            .background(Color.red)
            .previewLayout(.sizeThatFits)
            .environmentObject(AccountViewModel())
    }
}
