//
//  UIButton+.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/23/24.
//

import UIKit

extension UIButton {
    /// 버튼 Background Color를 상태별로 지정하는 메서드
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize = CGSize(width: 1.0, height: 1.0)
        
        let renderer = UIGraphicsImageRenderer(size: minimumSize)
        let colorImage = renderer.image { context in
            color.setFill()
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
}
