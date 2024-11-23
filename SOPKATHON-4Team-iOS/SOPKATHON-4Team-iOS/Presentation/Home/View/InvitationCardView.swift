//
//  InvitationCardView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 최유빈 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class InvitationCardView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private lazy var invitationCardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI&Layout
    
    private func setStyle() {
        backgroundColor = .gray
        
        titleLabel.do {
            $0.text = "내가 받은 초대장"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        invitationCardCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.alwaysBounceVertical = false
            $0.isPagingEnabled = true
        }
    }
    
    private func setUI() {
        addSubviews(titleLabel, invitationCardCollectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.centerX.equalToSuperview()
        }
        
        invitationCardCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(140)
        }
    }
    
    // MARK: - CollectionView
    
    private func setUpCollectionView() {
        
        invitationCardCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(InvitationCardCollectionViewCell.self, forCellWithReuseIdentifier: InvitationCardCollectionViewCell.className)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 12

        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDelegate

extension InvitationCardView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y != 0 {
            scrollView.contentOffset.y = 0
        }
    }
}

// MARK: - UICollectionViewDataSource

extension InvitationCardView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InvitationCardCollectionViewCell.className,
            for: indexPath) as? InvitationCardCollectionViewCell
        else { return UICollectionViewCell() }
        
        return cell
    }
}
