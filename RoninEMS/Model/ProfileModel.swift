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
    var user: Users?
    var profilePic: String
    var selfiePic: String
    var validIDPic: String
    var birthdate: String
    var gender: String
    var civilStatus: String
    var healthCard: String
    var hmoCardNumber: String
    var referralCode: String?
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
    
    private enum CodingKeys: String, CodingKey {
        case profileID = "profileID"
        case customerGroupID = "customerGroupID"
        case customerGroup = "customerGroup"
        case userID = "userID"
        case user = "user"
        case profilePic = "profilePic"
        case selfiePic = "selfiePic"
        case validIDPic = "validIDPic"
        case birthdate = "birthdate"
        case gender = "gender"
        case civilStatus = "civilStatus"
        case healthCard = "healthCard"
        case hmoCardNumber = "hmoCardNumber"
        case referralCode = "referralCode"
        case locationID = "locationID"
        case location = "location"
        case referrer = "referrer"
        case currentAddress = "currentAddress"
        case permanentAddress = "permanentAddress"
        case mobileNumber = "mobileNumber"
        case telephoneNumber = "telephoneNumber"
        case employmentStatus = "employmentStatus"
        case industry = "industry"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case isActive = "isActive"
    }
}

extension ProfileResponse {
    static func ==(lhs:ProfileResponse, rhs: ProfileResponse) -> Bool {
        return (lhs.profileID == rhs.profileID)
    }
}

struct CustomerGroup: Codable {
    let customerGroupID: Int
    let customerGroupName: String
    let createdAt: String
    let updatedAt: String
    let isActive: Bool
}
