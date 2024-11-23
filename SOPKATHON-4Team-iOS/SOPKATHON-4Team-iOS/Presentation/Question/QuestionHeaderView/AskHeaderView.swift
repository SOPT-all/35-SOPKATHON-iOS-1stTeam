//
//  AskHeaderView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class AskHeaderView : UIView {
    
    let titleLabel : UILabel = UILabel()
    
    let logoImageView: UIImageView = UIImageView()
    
    let backgroundButtonStackView: UIStackView = UIStackView()

    var nickname: String = "수민"
    
    private var selectedBackgroundIndex : Int = 0 { // 이 값을 백그라운드 값으로 서버에 넘겨줘야
        didSet {
            updateBackgroundButton()
        }
    }

    init() {
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backgroundButtons = [UIImage(resource: .firstBG),
                   UIImage(resource: .secondBG),
                   UIImage(resource: .thirdBG)].map {
        let button = UIButton()
        button.setImage($0, for: .normal)
        return button
    }
    
    func setHierarchy() {
        self.addSubviews(titleLabel,
                         logoImageView,
                         backgroundButtonStackView)
        
        
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(68)
            $0.leading.equalToSuperview().inset(27)
            $0.height.equalTo(60)
            $0.width.equalTo(137)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(72)
            $0.trailing.equalToSuperview().inset(27)
            $0.height.width.equalTo(140)
        }
        
        backgroundButtonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.equalToSuperview().inset(27)
            $0.width.equalTo(180)
            $0.height.equalTo(52)
        }
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.text = "\(nickname)님의 만남이\n더 맛있어지는 중!"
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.font = .bodyB20
        }
        
        logoImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(resource: .ask1HeaderLogo)
        }
        
        backgroundButtonStackView.do {
            $0.addArrangedSubviews(backgroundButtons)
            $0.setStackView(axis: .horizontal, spacing: 12)
        }
        
        backgroundButtons.enumerated().forEach { index, button in
            button.do {
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                $0.tag = index
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = 8
                setPlainButton($0)
            }
        }
        
        updateBackgroundButton() // 처음에 1 선택
    }
}

private extension AskHeaderView {
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard sender.tag != selectedBackgroundIndex else { return }
        selectedBackgroundIndex = sender.tag
    }
    
    func updateBackgroundButton() {
        backgroundButtons.enumerated().forEach { index, button in
            index == selectedBackgroundIndex ? setSelectedButton(button) : setPlainButton(button)
        }
        
        logoImageView.do {
            switch selectedBackgroundIndex{
            case 0:
                $0.image = UIImage(resource: .ask1HeaderLogo)
            case 1:
                $0.image = UIImage(resource: .ask2HeaderLogo)
            default:
                $0.image = UIImage(resource: .ask3HeaderLogo)
            }
        }
        
    }
    
    func setPlainButton(_ button: UIButton) {
        button.do {
            $0.layer.borderColor = UIColor.clear.cgColor
            $0.isSelected = false
        }
    }
    
    func setSelectedButton(_ button: UIButton) {
        button.do {
            $0.layer.borderColor = UIColor(resource: .gray300).cgColor
            $0.isSelected = true
        }
    }
    
}
