//
//  Users.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import Foundation

struct LoginResponse: Codable {
    let token_type: String
    let access_token: String
    let access_token_expiration: String
    let refresh_token: String
    let refresh_token_expiration: String
    let users: Users
}

extension LoginResponse {
    static func ==(lhs:LoginResponse, rhs: LoginResponse) -> Bool {
        return (lhs.users.userID == rhs
                    .users.userID)
    }
}

struct Users: Codable {
    let userID: Int
    let firstName: String
    let lastName: String
    let email: String
    let referralCode: String
    let password: String
    let isVerified: Bool
    let isVerifiedHQ: Bool
    let verifiedHQAt: String
    let verifiedAt: String
    let createdAt: String
    let updatedAt: String
    let isActive: Bool
    
}
