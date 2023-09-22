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
        return searchTextField
    }()
    
    lazy var searchButton:UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
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
    }
    // MARK : Setup UI
    private func setupUI(){
        view.addSubViews(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            searchTextField.widthAnchor.constraint(equalToConstant: 200),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    // MARK : Functions
    
    // MARK : Actions
    @objc func searchButtonTapped(){
        print("Working")
    }
}
