//
//  AccountViewModel.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/12/22.
//

import Foundation
import JWTDecode

class AccountViewModel : ObservableObject {
    var username: String = "ls1001@yopmail.com"
    var password: String = "12345"
    @Published var token: String? = ""
    @Published var userID: Int? = 0
    @Published var errorMessage: String?
    @Published var profileResponse : ProfileResponse?
}

extension AccountViewModel {
    private var isUserNameValid: Bool {
        !username.isEmpty
    }
    private var isPasswordValid: Bool {
        !password.isEmpty
    }
    private func isValid() -> Bool{
        var errors = [String]()
        if !isUserNameValid {
            errors.append("Email is empty")
        }
        if !isPasswordValid {
            errors.append("Password is empty")
        }
        if !errors.isEmpty {
            DispatchQueue.main.async {
                self.errorMessage = errors.joined(separator: ",")
            }
            return false
        }
        return true
    }
}

extension AccountViewModel {
    
    func loginUser(completion: @escaping(Result<LoginResponse, NetworkError>) -> Void){
        
        if !isValid() { return completion(.failure(.badURL))}
        
        let payload = LoginRequest(Email: username, Password: password)
        
        AccountService.shared.loginAccount(loginRequest: payload) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    UserDefaults.standard.set(String(response.access_token), forKey: "accessToken") //String
                    guard let storedToken = UserDefaults.standard.string(forKey: "accessToken") else { return }
                    self.token = storedToken
                    self.userID = response.users.userID
                    completion(.success(response))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func getProfile(completion: @escaping(Result<ProfileResponse,NetworkError>) -> Void){
        
        do {
            guard let storedToken = self.token else { return }
            
            if storedToken.isEmpty {
                print("getProfile empty items=\(String(describing: self.userID)) - \(storedToken)")
                return
            }

            let jwt = try decode(jwt: storedToken)
            let claim = jwt.claim(name: "unique_name")
            if let uniqueName = claim.string {
                print("unique_name in jwt was \(uniqueName)")
                self.userID = Int(uniqueName) ?? 0
            }
        }catch let error as NSError {
            print("token is invalid\(error.localizedDescription)")
        }
        
        AccountService.shared.getProfile(id: self.userID ?? 0, token: self.token ?? "") { profileResponse in
            switch profileResponse {
                case .success(let response):
                DispatchQueue.main.async {
                    self.profileResponse = response
                    completion(.success(response))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
