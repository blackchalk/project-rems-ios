//
//  Profile.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/13/22.
//

import Foundation

struct ProfileResponse: Codable ,Equatable {
    var profileID: Int
    var customerGroupID: Int
    var customerGroup: CustomerGroup
    var userID: Int
    var user: Users
    var profilePic: String
    var selfiePic: String
    var validIDPic: String
    var birthdate: String
    var gender: String
    var civilStatus: String
    var healthCard: String
    var hmoCardNumber: String
    var referralCode: String
    var locationID: String?
    var location: String?
    var referrer: String?
    var currentAddress: String
    var permanentAddress: String
    var mobileNumber: String
    var telephoneNumber: String
    var employmentStatus: String
    var industry: String
    var createdAt: String
    var updatedAt: String
    var isActive: Bool
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profileID"
        case customerGroupID = "customerGroupID"
        case customerGroup
        case userID
        case user
        case profilePic
        case selfiePic
        case validIDPic
        case birthdate
        case gender
        case civilStatus
        case healthCard
        case hmoCardNumber
        case referralCode
          case locationID
          case location
          case referrer
        case currentAddress
        case permanentAddress
        case mobileNumber
        case telephoneNumber
        case employmentStatus
        case industry
        case createdAt
        case updatedAt
        case isActive
    }
}

extension ProfileResponse {
    static func ==(lhs:ProfileResponse, rhs: ProfileResponse) -> Bool {
        return (lhs.user.userID == rhs
                    .user.userID)
    }
}

struct CustomerGroup: Codable {
    let customerGroupID: Int
    let customerGroupName: String
    let createdAt: String
    let updatedAt: String
    let isActive: Bool
}
