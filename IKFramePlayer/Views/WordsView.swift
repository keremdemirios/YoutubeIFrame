//
//  WordsView.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 25.09.2023.
//

import UIKit

class WordsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        
        backgroundColor = .systemGray
    }
}


//private let wordsView: UIView = {
//    let wordsView = UIView()
//    wordsView.translatesAutoresizingMaskIntoConstraints = false
//    wordsView.layer.cornerRadius = 10
//    wordsView.layer.borderWidth = 1
//    wordsView.layer.borderColor = UIColor.systemGray2.cgColor
//    wordsView.backgroundColor = .systemGray
//    return wordsView
//}()
