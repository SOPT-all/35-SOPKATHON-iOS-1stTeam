//
//  LabelFactory.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/22/24.
//

import UIKit

import Then

struct LabelFactory {
    /// - Parameters:
    ///   - text: Label에 보여줄 텍스트
    ///   - font: 텍스트의 폰트
    ///   - backgroundColor: Label의 배경색
    ///   - textColor: text 색상
    ///   - textAlignment: text 정렬
    ///
    static func build(
        text: String? = "",
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .center) -> UILabel {
            return UILabel().then {
                $0.text = text
                $0.font = font
                $0.backgroundColor = backgroundColor
                $0.textColor = textColor
                $0.textAlignment = textAlignment
            }
        }
}
