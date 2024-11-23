//
//  UIStackView+.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    func setStackView(axis: NSLayoutConstraint.Axis = .vertical,
                      distribution: UIStackView.Distribution = .fillEqually,
                      alignment: UIStackView.Alignment = .fill,
                      spacing: CGFloat = 0) {
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
