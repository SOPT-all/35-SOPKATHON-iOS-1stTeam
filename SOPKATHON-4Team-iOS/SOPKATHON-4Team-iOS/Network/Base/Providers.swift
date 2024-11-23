//
//  Providers.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

import Moya

struct Providers {
    static let calendarProvider = MoyaProvider<QuestionTargetType>(withAuth: true)
    static let authProvider = MoyaProvider<AuthTargetType>(withAuth: true)
}

extension MoyaProvider {
    convenience init(withAuth: Bool) {
        if withAuth {
            self.init(session: Session(interceptor: AuthInterceptor.shared),
                      plugins: [NetworkLoggerPlugin(verbose: true)])
        } else {
            self.init(plugins: [NetworkLoggerPlugin(verbose: true)])
        }
    }
}
