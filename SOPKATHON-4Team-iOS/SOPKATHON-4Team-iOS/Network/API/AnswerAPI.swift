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

extension Answer {
    static let mockData: [Answer] = {
        let solvedQuestions = [
            SolvedQuestion(
                subject: "중간에 신라면 투움바 먹고 왔는데 너무 맛있었다. 불닭 참치마요 삼각김밥도 먹었다. 완전 떵개했다. 근데도 난 여전히 배고프다.",
                answer: false,
                isCorrect: true
            ),
            SolvedQuestion(
                subject: "아침 먹고 집갈거야. 뒤풀이 갈거야",
                answer: true,
                isCorrect: false
            ),
            SolvedQuestion(
                subject: "35기 AND SOPT 사람들과 솝커톤 했는데 힘들기는 커녕 행복하기만 했어! 이 사람들과 평생 함께 하고 싶다는 마음이 들면 나.. 이상한 걸까.",
                answer: false,
                isCorrect: true
            )
        ]
        
        return [
            Answer(theme: 0, questionnaireOwner: "유빈", solvedQuestions: solvedQuestions),
            Answer(theme: 1, questionnaireOwner: "세민", solvedQuestions: solvedQuestions),
            Answer(theme: 2, questionnaireOwner: "수민", solvedQuestions: solvedQuestions),
            Answer(theme: 3, questionnaireOwner: "명진", solvedQuestions: solvedQuestions)
        ]
    }()
}
