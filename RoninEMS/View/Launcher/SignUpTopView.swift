//
//  SignUpTopView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import SwiftUI

struct SignUpTopView : View {
    var body: some View {
        VStack {
        Image("ronin-final-logo")
            .resizable()
            .scaledToFit()
        }
    }
}

struct SignUpTopView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTopView()
            .previewLayout(.sizeThatFits)
    }
}
