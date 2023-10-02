//
//  WordsCollectionViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 27.09.2023.
//

import UIKit

class WordsCustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "WordsCollectionViewCell"
    
    private let wordsLabel: UILabel = {
        let wordsLabel = UILabel()
        wordsLabel.translatesAutoresizingMaskIntoConstraints = false
        wordsLabel.text = "#eagle"
        wordsLabel.textColor = .label
        wordsLabel.numberOfLines = 1
        wordsLabel.textAlignment = .center
        wordsLabel.font = .systemFont(ofSize: 16.0)
        return wordsLabel
    }()
    
    lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
//        deleteButton.addTarget(self, action: #selector(deleteWord), for: .touchUpInside)
        return deleteButton
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
//        contentView.backgroundColor = .black
    }
    
    private func configureUI() {
        contentView.addSubViews(wordsLabel)
        NSLayoutConstraint.activate([
            wordsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wordsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            wordsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            wordsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
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
