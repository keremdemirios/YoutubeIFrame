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
        return searchTextField
    }()
    
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    // MARK : Configure
    private func configure(){
        setupUI()
    }
    // MARK : Setup UI
    private func setupUI(){
        view.addSubViews(searchTextField)
        NSLayoutConstraint.activate([
            
        ])
    }
    // MARK : Functions
    
    // MARK : Actions

}
