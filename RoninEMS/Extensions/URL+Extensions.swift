//
//  URL.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import Foundation

extension URL {
    static func authenticateUser() -> URL? {
        return URL(string: String(Config.baseURL + "/v1/auth/token"))
    }
    
    static func getUsersProfile(id: Int) -> URL? {
        return URL(string: String(Config.baseURL + "/v1/users/profiles/".appending(String(id))))
    }
    
    static func gotoForgetPasswordURL() -> URL? {
        return URL(string: String(Config.baseURL + "/password-reset.html"))
    }
}
