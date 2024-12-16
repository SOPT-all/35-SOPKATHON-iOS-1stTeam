//
//  UIViewController+.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 12/16/24.
//

import UIKit

extension UIViewController {
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
