//
//  Dashboard.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import SwiftUI

struct Dashboard: View {

    var body: some View {
        VStack{
            SignUpTopView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
        .ignoresSafeArea(.all)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
