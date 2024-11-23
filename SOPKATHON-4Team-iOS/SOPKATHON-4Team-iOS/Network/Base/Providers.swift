//
//  Providers.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

import Moya

struct Providers {
    // 필요에 따라 AuthInterceptor 없이 MoyaProvider를 생성
    static let questionProvider = MoyaProvider<QuestionTargetType>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let authProvider = MoyaProvider<AuthTargetType>(plugins: [NetworkLoggerPlugin(verbose: true)])
}
