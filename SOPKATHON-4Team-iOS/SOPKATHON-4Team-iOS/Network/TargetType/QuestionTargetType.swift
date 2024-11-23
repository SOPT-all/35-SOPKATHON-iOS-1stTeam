//
//  QuestionTargetType.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import Foundation
import Moya

enum QuestionTargetType {
    case getQuestionnaire
    case getQuestionnaires(invitationCode: Int)
    case postQuestionnaire(theme: Int, questions: [Question])
    case solveQuestionnaire(answerList: [Int])
}

extension QuestionTargetType: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            fatalError("baseURL could not be configured")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .getQuestionnaire, .postQuestionnaire:
            return "/questionnaire"
        case .getQuestionnaires:
            return "/api/v1/questionnaire"
        case .solveQuestionnaire:
            return "/me/questionnaires"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getQuestionnaire, .getQuestionnaires:
            return .get
        case .postQuestionnaire, .solveQuestionnaire:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getQuestionnaire:
            return .requestPlain
            
        case .getQuestionnaires(let invitationCode):
            return .requestParameters(
                parameters: ["invitationCode": invitationCode],
                encoding: URLEncoding.default
            )
            
        case .postQuestionnaire(let theme, let questions):
            return .requestParameters(
                parameters: [
                    "theme": theme,
                    "questions": questions
                ],
                encoding: JSONEncoding.default
            )
            
        case .solveQuestionnaire(let answerList):
            return .requestParameters(
                parameters: [
                    "answerList": answerList
                ],
                encoding: JSONEncoding.default
            )
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
