//
//  Dashboard.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import SwiftUI

struct Dashboard: View {

    var body: some View {
        VStack {
            HStack {
                Image("ronin_logo_final")
                    .frame(maxWidth: .infinity,alignment: .topLeading)
                    .padding(.top, 50)
            }
            Rectangle().fill(Color.ui.red).frame(maxWidth: 800, maxHeight: 1)
                .foregroundColor(Color.ui.red)
            Image(systemName: "bandage")
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                .font(Font.custom("poppins_bold", size: 74))
                .imageScale(.large)
            Spacer()
        }

    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
