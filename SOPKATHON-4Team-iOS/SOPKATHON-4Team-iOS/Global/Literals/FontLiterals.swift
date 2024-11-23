//
//  FontLiterals.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/24/24.
//

import UIKit

public extension UIFont {
    @nonobjc class var titleB28: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 28)
    }

    @nonobjc class var titleR28: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 28)
    }

    @nonobjc class var titleB24: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 24)
    }

    @nonobjc class var titleR24: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 24)
    }

    @nonobjc class var bodyB20: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 20)
    }

    @nonobjc class var bodyR20: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 20)
    }

    @nonobjc class var bodyB18: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 18)
    }

    @nonobjc class var bodyR18: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 18)
    }

    @nonobjc class var bodyB16: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 16)
    }

    @nonobjc class var bodyR16: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 16)
    }

    @nonobjc class var bodyB14: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 14)
    }

    @nonobjc class var bodyR14: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 14)
    }

    @nonobjc class var bodyB12: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 12)
    }

    @nonobjc class var bodyR12: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 12)
    }
}

public enum FontName: String {
    case pretendardLight = "Pretendard-Light"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardBold = "Pretendard-Bold"
}

public extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size) else {
            print("🍎 \(style.rawValue) font 가 등록되지 않았습니다.! 🍎")
            print("🍎 기본 폰트 출력 ! 🍎")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}
