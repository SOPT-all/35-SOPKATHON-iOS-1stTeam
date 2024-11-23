//
//  MainViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 최유빈 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    let invitationCardView = InvitationCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(invitationCardView)
    }
    
    private func setLayout() {
        invitationCardView.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
    }
}
