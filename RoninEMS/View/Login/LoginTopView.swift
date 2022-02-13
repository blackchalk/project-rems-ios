//
//  LoginTopView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/10/22.
//

import SwiftUI

struct LoginTopView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome Back,")
                .font(Font.custom("opensans_regular", size: 42))
                .accentColor(.primary)
                .foregroundColor(Color("titleTextColor"))
            Text("Log In!")
                .font(.system(size: 68, weight: .bold, design: .default))
                .foregroundColor(Color("titleTextColor"))
        }
    }
}

struct LoginTopView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTopView()
            .previewLayout(.sizeThatFits)
        LoginTopView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
