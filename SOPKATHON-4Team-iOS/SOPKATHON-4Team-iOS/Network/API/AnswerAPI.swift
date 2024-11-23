//
//  AnswerAPI.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation

struct AnswerListResponse: Codable {
    let answerList: [Answer]
}

struct Answer: Codable {
    let theme: Int
    let questionnaireOwner: String
    let solvedQuestions: [SolvedQuestion]
}

// Question structure
struct SolvedQuestion: Codable {
    let subject: String
    let answer: Bool
    let isCorrect: Bool
}
