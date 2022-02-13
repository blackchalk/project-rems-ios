//
//  Config.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import Foundation

struct Config {
    
    static let webviewBaseUrl: String = "https://mobile-dev.roninems.com"
    
    static let remsBaseUrl = "https://pcsapi.vstecs.com.ph"
    static let dispatchBaseUrl = "https://pcsapi.vstecs.com.ph"
    static let pacBaseUrl = "https://pcsapi.vstecs.com.ph"
    static let packageBaseUrl = "https://pcsapi.vstecs.com.ph"
    static let licenseBaseUrl = "https://pcsapi.vstecs.com.ph:4400"

    static let prod: String = "https://api.roninems.com"
    
    static let baseURL = remsBaseUrl
    static let appSecret = "r0n!n@pP--cL!3nT--@pP"

    struct Notifications {
        static let awareUser = "aware_user"
    }
}
