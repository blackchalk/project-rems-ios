//
//  OnboardingTopMenu.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct OnboardingTopMenu: View {
    var body: some View {
        HStack {
            Image("menu_logo")
                .frame(maxWidth: .infinity ,alignment: .leading)
            SkipButtonView()
        }.padding(.horizontal, 24)
    }
}

struct OnboardingTopMenu_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTopMenu()
            .previewLayout(.sizeThatFits)
    }
}
