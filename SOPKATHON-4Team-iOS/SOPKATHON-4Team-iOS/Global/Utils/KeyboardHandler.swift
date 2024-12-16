//
//  KeyboardHandler.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 12/16/24.
//

import UIKit

final class KeyboardHandler: NSObject, UITextFieldDelegate {
    
    private weak var originalDelegate: UITextFieldDelegate?
    
    init(textField: UITextField) {
        super.init()
        self.originalDelegate = textField.delegate
        textField.delegate = self
    }
    
}

extension KeyboardHandler {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return originalDelegate?.textFieldShouldReturn?(textField) ?? true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return originalDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
}
