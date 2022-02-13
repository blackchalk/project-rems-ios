//
//  AccountService.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import Foundation

//{
//    "grant_type": "password",
//    "Email": "ls1001@yopmail.com",
//    "Password": "12345"
//}


struct LoginRequest: Codable {
    var grant_type: String = "password"
    let Email: String
    let Password: String
}

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class AccountService {
    
    private init() { }
    
    static let shared = AccountService()
    
    func loginAccount(loginRequest: LoginRequest, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void){
        
        guard let url = URL.authenticateUser() else {
            return completion(.failure(.badURL))
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Config.appSecret, forHTTPHeaderField: "app-secret")
        request.httpBody = try? JSONEncoder().encode(loginRequest)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let loginResponse = try! JSONDecoder().decode(LoginResponse.self, from: data) as? LoginResponse

            if let loginResponse = loginResponse {
                completion(.success(loginResponse))
            }else{
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getProfile(id: Int, token: String, completion: @escaping (Result<ProfileResponse, NetworkError>) -> Void){
        
        guard let url = URL.getUsersProfile(id: id) else {
            return completion(.failure(.badURL))
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Config.appSecret, forHTTPHeaderField: "app-secret")
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let decodedValue = try! JSONDecoder().decode(ProfileResponse.self, from: data) as? ProfileResponse

            if let decodedValue = decodedValue {
                completion(.success(decodedValue))
            }else{
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
