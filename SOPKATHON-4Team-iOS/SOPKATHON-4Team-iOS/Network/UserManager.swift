//
//  UserManager.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

import Moya

enum FTError: Error {
    case networkFail
    case decodeFail
    case etc
}

final class UserManager {
    static let shared = UserManager()
    
    private var authProvider = Providers.authProvider
    
    @UserDefaultWrapper<Int>(key: "userId") public var userId
    @UserDefaultWrapper<String>(key: "nickName") public var nickName
    
    var hasUserId: Bool { return self.userId != nil }
    
    private init() {
        
    }
    
    func signIn(nickName: String, completion: @escaping(Result<Bool, FTError>) -> Void) {
        print("🍎🍎 signIn 함수 시작🍎🍎")
        authProvider.request(.signIn(nickName: nickName)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                let status = result.statusCode
                if 200..<300 ~= status {
                    do {
                        let responseDto = try result.map(BaseResponse<AuthAPI>.self)
                        guard let data = responseDto.data else {
                            completion(.failure(.networkFail))
                            return
                        }
                        
                        self.nickName = nickName
                        self.userId = data.memberId
                        
                        completion(.success(true))
                    } catch {
                        print("🍎🍎🍎🍎\(error.localizedDescription)")
                        completion(.failure(.networkFail))
                    }
                } else if status >= 400 {
                    print("‼️‼️ 400 error ‼️‼️")
                    completion(.failure(.networkFail))
                }
            case .failure(let error):
                print(" 🔥 🔥 \(error.localizedDescription)")
                if let response = error.response {
                    if let responseData = String(bytes: response.data, encoding: .utf8) {
                        print("\n 🔥 SignIn 메세지 \(responseData)\n")
                    } else {
                        print(" 🔥Failed to decode response data as UTF-8 string.")
                    }
                } else {
                    print(error.localizedDescription)
                }
                completion(.failure(.networkFail))
            }
        }
    }
    
    func logout() {
        self.resetTokens()
    }
    
    private func resetTokens() {
        self.userId = nil
    }
}

