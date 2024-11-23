//
//  CustomButton.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이명진 on 11/23/24.
//

import UIKit

import SnapKit
import Then

public final class CustomButton: UIButton {
    
    private var title: String
    private let font: UIFont
    private let cornerRadius: CGFloat
    private let borderColor: UIColor
    
    private var normalColor: UIColor = .clear
    private var normalTextColor: UIColor = .white
    private var disableColor: UIColor = .clear
    private var disableTextColor: UIColor = .gray
    
    
    // MARK: - Init

    public init(
        title: String,
        font: UIFont = .systemFont(ofSize: 16),
        cornerRadius: CGFloat = 0,
        borderColor: UIColor = .clear
    ) {
        self.title = title
        self.font = font
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        super.init(frame: .zero)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomButton {
    
    @discardableResult
    public func setEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        updateUI()
        return self
    }
    
    @discardableResult
    public func setTitle(title: String) -> Self {
        self.title = title
        updateUI()
        return self
    }
    
    @discardableResult
    public func setButtonStatus(normalColor: UIColor, normalTextColor: UIColor, disableColor: UIColor, disableTextColor: UIColor) -> Self {
        self.normalColor = normalColor
        self.normalTextColor = normalTextColor
        self.disableColor = disableColor
        self.disableTextColor = disableTextColor
        updateUI()
        return self
    }
}

extension CustomButton {
    private func setStyle() {
        configuration = UIButton.Configuration.plain()
        makeBorder(width: 1, color: borderColor)
        layer.cornerRadius = self.cornerRadius
        clipsToBounds = true
        updateUI()
    }
    
    private func updateUI() {
        var updatedConfiguration = configuration ?? UIButton.Configuration.plain()
        
        switch self.state {
        case .normal:
            updatedConfiguration.background.backgroundColor = normalColor
            updatedConfiguration.attributedTitle = AttributedString(
                title,
                attributes: AttributeContainer([
                    NSAttributedString.Key.font: font,
                    NSAttributedString.Key.foregroundColor: normalTextColor
                ])
            )
        case .disabled:
            updatedConfiguration.background.backgroundColor = disableColor
            updatedConfiguration.attributedTitle = AttributedString(
                title,
                attributes: AttributeContainer([
                    NSAttributedString.Key.font: font,
                    NSAttributedString.Key.foregroundColor: disableTextColor
                ])
            )
        default:
            break
        }
        
        self.configuration = updatedConfiguration
    }
}
