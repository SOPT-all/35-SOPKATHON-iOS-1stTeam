//
//  AuthInterceptor.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

import Alamofire
import Moya

///// 토큰 만료 시 자동으로 refresh를 위한 서버 통신
final class AuthInterceptor: RequestInterceptor {
    
    static let shared = AuthInterceptor()
    
    private var retryCount = 0
    private let maxRetryCount = 3
    
    private init() {}
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        guard urlRequest.url?.absoluteString.hasPrefix(Config.baseURL) == true,
              let userId = UserManager.shared.userId
        else {
            completion(.success(urlRequest))
            return
        }
        
        urlRequest.setValue(String(userId), forHTTPHeaderField: "userId")
        print("adator 적용 \(urlRequest.headers)")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("retry 진입")
        guard retryCount < maxRetryCount,
              let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 401,
              let pathComponents = request.request?.url?.pathComponents,
              !pathComponents.contains("getNewToken")
        else {
            dump(error)
            completion(.doNotRetryWithError(error))
            return
        }
    }
}



