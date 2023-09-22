//
//  HomeViewController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 22.09.2023.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK : UI Elements
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.backgroundColor = .label
        searchTextField.layer.cornerRadius = 12
        searchTextField.textColor = .systemBackground
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.label.cgColor
        return searchTextField
    }()
    
    lazy var searchButton:UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .systemGreen
        searchButton.layer.cornerRadius = 10
        return searchButton
    }()
    
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    // MARK : Configure
    private func configure(){
        hideKeyboardWhenTappedAround() // Hide keyboard when tapped around + extension method
        setupUI()
        
        searchTextField.delegate = self
    }
    // MARK : Setup UI
    private func setupUI(){
        view.addSubViews(searchTextField, searchButton)
        NSLayoutConstraint.activate([
            // text field constraints
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 60),
            // button constraints
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 100),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
            searchButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    // MARK : Functions
    
    // MARK : Actions
    @objc func searchButtonTapped(){
        let vc = PlayerViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    
    // Textfield'a ne yazilip ne yazilmayacagini belirtiliyor. (Rakam yasagi var.)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == searchTextField {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let containsNumber = newText.rangeOfCharacter(from: .decimalDigits) != nil
            
            if !containsNumber {
                return true // yazilabilir
            } else {
                return false // yazilamaz
            }
        }
        return true
    }
}
