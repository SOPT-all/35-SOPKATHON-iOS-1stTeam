//
//  AuthTargetType.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation
import Moya

enum AuthTargetType {
    case signIn(nickName: String)
}

extension AuthTargetType: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            fatalError("baseURL could not be configured")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signIn(let nickName):
            return .requestParameters(
                parameters: ["nickName": nickName],
                encoding: JSONEncoding.default
            )
        }
    }
        
    var headers: [String: String]? {
        return Config.defaultHeader
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
