//
//  BaseResponse.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Int
    let message: String
    let data: T?
}

/// data가 없는 API 통신에서 사용할 BlankData 구조체
struct BlankData: Codable {
}

