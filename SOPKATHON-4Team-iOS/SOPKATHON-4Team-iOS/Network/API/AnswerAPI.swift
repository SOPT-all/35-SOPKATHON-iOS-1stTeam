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

struct AnswerCountResponse: Codable {
    let answerCount:Int
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

extension Answer {
    static let mockData: [Answer] = {
        let solvedQuestions = [
            SolvedQuestion(subject: "주제 1", answer: true, isCorrect: true),
            SolvedQuestion(subject: "주제 2", answer: false, isCorrect: false),
            SolvedQuestion(subject: "주제 3", answer: true, isCorrect: true),
            SolvedQuestion(subject: "주제 4", answer: false, isCorrect: true),
            SolvedQuestion(subject: "주제 5", answer: true, isCorrect: false)
        ]
        
        return [
            Answer(theme: 1, questionnaireOwner: "유빈", solvedQuestions: solvedQuestions),
            Answer(theme: 2, questionnaireOwner: "세민", solvedQuestions: solvedQuestions),
            Answer(theme: 3, questionnaireOwner: "수민", solvedQuestions: solvedQuestions),
            Answer(theme: 2, questionnaireOwner: "명진", solvedQuestions: solvedQuestions)
        ]
    }()
}
