//
//  LicenseModel.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/15/22.
//

import Foundation

struct GetLicenseBaseResponse: Codable, Equatable {
    var code: Int
    var status: String
    var message: String
    var results: GetLicenseDetailsResponse
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case message = "message"
        case results = "results"
    }
}

extension GetLicenseBaseResponse {
    static func ==(lhs:GetLicenseBaseResponse, rhs: GetLicenseBaseResponse) -> Bool {
        return (lhs.results.licenseID == rhs.results.licenseID)
    }
}

struct GetLicenseDetailsResponse: Codable   {
    
    var licenseID: Int
    var customerID: Int
    var licenseCode: String
    var effectivityDate: String
    var effectivityEndDate: String
    var status: String
    var profile: LicenseProfileResponse?
    var activePackage: GetActivePackageResponse
    var offering: [Offering]
    
    private enum CodingKeys: String, CodingKey {
        case licenseID = "licenseID"
        case customerID = "customerID"
        case licenseCode = "licenseCode"
        case effectivityDate = "effectivityDate"
        case effectivityEndDate = "effectivityEndDate"
        case status = "status"
        case profile = "profile"
        case activePackage = "package"
        case offering = "offering"
    }
}

struct LicenseProfileResponse: Codable {
    var profileID: Int
    var customerGroupID: Int
    var customerGroup: CustomerGroup
    var userID: Int
    var user: LicenseUserResponse?
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

struct LicenseUserResponse: Codable {
    let userID: Int
    let firstName: String
    let lastName: String
    let email: String
    let isVerified: Bool
    let isVerifiedHQ: Bool
    let verifiedHQAt: String
    let verifiedAt: String
}


struct Offering: Codable {
    
    var offeringID : Int
    var offeringName : String
}

struct GetActivePackageResponse: Codable  {

    var packageID: Int
    var packageName: String
    var packageTypeID: Int
    var roninPointsPrice: Int
    var pesoPrice: Int
    var discount: Int
    var createdAt: String
    var updatedAt: String
    var isActive: Bool
}
