//
//  WordsView.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 25.09.2023.
//

import UIKit

class WordsView: UIView {
    
    private let wordsLabel:UILabel = {
        let wordsLabel = UILabel()
        wordsLabel.translatesAutoresizingMaskIntoConstraints = false
        wordsLabel.text = "#domates"
        wordsLabel.textColor = .systemGray6
        wordsLabel.sizeToFit()
        return wordsLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        configureUI()
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        
        backgroundColor = .systemGray
    }
    
    private func configureUI(){
        addSubViews(wordsLabel)
        NSLayoutConstraint.activate([
            wordsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            wordsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        ])
    }
}



