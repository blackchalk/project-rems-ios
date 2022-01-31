//
//  Config.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import Foundation

struct Config {
    
    static let qa: String = "https://mobile-dev.roninems.com"
    static let prod: String = "https://api.roninems.com"
    static let baseURL = qa

    struct Notifications {
        static let awareUser = "aware_user"
    }
}
