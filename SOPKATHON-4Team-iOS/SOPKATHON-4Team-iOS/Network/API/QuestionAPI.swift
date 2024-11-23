//
//  QuestionAPI.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

struct Questionnaires: Codable {
    let theme: Int
    let questions: [Question]
}

struct Question: Codable {
    let subject: String
    let answer: Bool
}

struct inviteCodeAPI: Codable {
    let inviteCode: Int
}
