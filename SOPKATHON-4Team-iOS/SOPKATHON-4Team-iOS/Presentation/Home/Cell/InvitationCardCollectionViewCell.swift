//
//  InvitationCardCollectionViewCell.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 최유빈 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class InvitationCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let backgroundImageView = UIImageView()

    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with answer: Answer) {
        titleLabel.text = "From. \(answer.questionnaireOwner)"
        configureBackgroundImage(for: answer.theme)
    }

    private func configureBackgroundImage(for theme: Int) {
        switch theme {
        case 1:
            backgroundImageView.image = .cardImage1
        case 2:
            backgroundImageView.image = .cardImage2
        case 3:
            backgroundImageView.image = .cardImage3
        default:
            backgroundImageView.image = .topLogo
        }
    }
    
    // MARK: - UI&Layout

    private func setStyle() {
        contentView.do {
            $0.layer.cornerRadius = 10
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .white
        }
        
        backgroundImageView.do {
            $0.layer.cornerRadius = 10
        }
    }

    private func setHierarchy() {
        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(titleLabel)
    }

    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
}
