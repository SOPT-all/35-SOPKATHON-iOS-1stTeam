//
//  Untitled.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class SolveHeaderView : UIView {
    
    let titleLabel : UILabel = UILabel()
    
    let logoImageView: UIImageView = UIImageView()

    var nickname: String = "수민"
    
    var backgroundIndex: Int = 0 //서버에서 배경 숫자 받아오기

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
            $0.top.equalToSuperview().offset(72)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(140)
        }
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.text = "From.\n\(nickname)님의 문제를\n풀고있어요!"
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.font = .bodyB20
        }
        
        logoImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            switch backgroundIndex{
            case 0:
                $0.image = UIImage(resource: .ask1HeaderLogo)
            case 1:
                $0.image = UIImage(resource: .ask2HeaderLogo)
            default:
                $0.image = UIImage(resource: .ask3HeaderLogo)
            }
        }
    }
}
