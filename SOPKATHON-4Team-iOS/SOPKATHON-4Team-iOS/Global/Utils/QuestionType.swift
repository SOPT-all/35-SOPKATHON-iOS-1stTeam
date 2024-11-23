//
//  QuestionType.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/23/24.
//

enum QuestionType {
    
    case ask
    case solve
    case grade
    
    var footerButtonTitle : String {
        switch self {
        case .ask:
            return "확인"
        case .solve:
            return "채점하기"
        case .grade:
            return "홈으로 돌아가기"
        }
    }
}
