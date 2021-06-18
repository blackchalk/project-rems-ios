//
//  SkipButtonView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct SkipButtonView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool?
    var body: some View {
        Button(action: {
            isOnBoarding = false
        }, label: {
            Text("Skip")
                .font(.callout)
                .fontWeight(.light)
        })
        .accentColor(.gray)
    }
}

struct SkipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SkipButtonView()
            .previewLayout(.sizeThatFits)
    }
}
