//
//  Config.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import UIKit

struct Config {
    private init() {}
    
    // 토핑 Main Server
    static var baseURL: String {
        return "15.165.106.248/api/v1/"
    }
    
    static var defaultHeader: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    static var headerWithAccessToken: [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "\(Config.userId)"
        ]
    }
    
    static var userId: Int {
        return UserManager.shared.userId ?? 0
    }
}

