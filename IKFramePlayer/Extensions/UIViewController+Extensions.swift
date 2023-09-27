//
//  UIViewController+Extensions.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 22.09.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String ,completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("OK tapped.")
            completion()
        }))
        
        present(alert, animated: true)
    }
}
