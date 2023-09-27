//
//  WordsCollectionViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 27.09.2023.
//

import UIKit

class WordsCustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "WordsCollectionViewCell"
    
    private let wordsLabel:UILabel = {
        let wordsLabel = UILabel()
        wordsLabel.translatesAutoresizingMaskIntoConstraints = false
        wordsLabel.text = "#eagle"
        wordsLabel.textColor = .systemGray6
        wordsLabel.backgroundColor = .red
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
        contentView.backgroundColor = .black
    }
    
    private func configureUI() {
        contentView.addSubViews(wordsLabel)
        NSLayoutConstraint.activate([
            wordsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wordsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        wordsLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        wordsLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    public func configureLabel(label: String){
        wordsLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        wordsLabel.text = nil
    }
}
