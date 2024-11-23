//
//  GradeHeaderView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class GradeHeaderView: UIView {
    
    let titleLabel: UILabel = UILabel()
    
    let logoImageView: UIImageView = UIImageView()
    
    var nickname: String = "수민"
    
    init() {
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(titleLabel,
                         logoImageView)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(97)
            $0.trailing.equalToSuperview().inset(27)
            $0.height.equalTo(90)
            $0.width.equalTo(207)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview()
            $0.width.equalTo(156)
            $0.height.equalTo(162)
        }
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.text = "To.\n\(nickname)님의 채점 결과를\n확인해보세요!"
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.font = .bodyB20
        }
        
        logoImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.image = .gradeResult
        }
        
    }
}
