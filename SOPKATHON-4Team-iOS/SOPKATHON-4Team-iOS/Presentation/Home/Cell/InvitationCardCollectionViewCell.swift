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

    // MARK: - UI&Layout

    private func setStyle() {
        backgroundColor = .gray
        
        contentView.do {
            $0.makeBorder(
                width: 1,
                color: .gray,
                cornerRadius: 10
            )
            $0.backgroundColor = .white
        }
        
        titleLabel.do {
            $0.text = "누구의 초대장"
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
        
    }

    private func setHierarchy() {
        contentView.addSubview(titleLabel)
    }

    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
