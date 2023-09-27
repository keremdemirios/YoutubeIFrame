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
        wordsLabel.textColor = .systemGray6
        wordsLabel.backgroundColor = .red
        wordsLabel.sizeToFit()
        return wordsLabel
    }()
    
    lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteWord), for: .touchUpInside)
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
    
    @objc func deleteWord() {
        guard let collectionView = superview as? UICollectionView,
            let indexPath = collectionView.indexPath(for: self) else {
            return
        }
        
        // IndexPath kullanarak wordsList'ten ilgili öğeyi kaldırın
        wordsList.remove(at: indexPath.row)
        // CollectionView'deki ilgili hücreyi kaldırın
        collectionView.deleteItems(at: [indexPath])
    }

}
