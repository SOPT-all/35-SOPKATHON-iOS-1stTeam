//
//  ScoreView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/24/24.
//

import UIKit
import SnapKit

class ScoreView: UIView {
    
    var score: Int = 3 {
        didSet {
            updateScoreView()
        }
    }
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bodyB20
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bodyB20
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let scoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var goToScoreHomeButton = CustomButton(
        title: "홈으로 돌아가기",
        font: UIFont.bodyB18,
        cornerRadius: 8
    ).setButtonStatus(
        normalColor: .tpOrange,
        normalTextColor: .white,
        disableColor: .gray500,
        disableTextColor: .white
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        updateScoreView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(countLabel, descriptionLabel, scoreImageView, goToScoreHomeButton)
    }
    
    private func setLayout() {
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(210)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        scoreImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(88)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(243)
            $0.height.equalTo(205)
        }
        
        goToScoreHomeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(52)
        }
    }
    
    func updateScoreView() {
        countLabel.text = "\(score)/3"
        
        switch score {
        case 1:
            descriptionLabel.text = """
            근황 업데이트가 필요해!
            언제 시간되는지
            알려줘!!
            """
            scoreImageView.image = UIImage(named: "Score1")
        case 2:
            descriptionLabel.text = """
            오.. 제법인데?
            보충설명 해줄게~
            빨리 날 잡자!!
            """
            scoreImageView.image = UIImage(named: "Score2")
        case 3:
            descriptionLabel.text = """
            완전 감동이야..
            당장이라도
            만나고 싶어!!
            """
            scoreImageView.image = UIImage(named: "Score3")
        default:
            descriptionLabel.text = """
            나를 이렇게 몰라..?
            오답노트 써야겠다.
            당장 만나!!
            """
            scoreImageView.image = UIImage(named: "Score0")
        }
    }
    
    func updateScore(to newScore: Int) {
        guard (0...3).contains(newScore) else { return }
        score = newScore
    }
}

