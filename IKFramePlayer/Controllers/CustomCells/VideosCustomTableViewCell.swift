//
//  VideosCustomTableViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 2.10.2023.
//

import UIKit

class VideosCustomTableViewCell: UITableViewCell {
    static let identifier = "VideosCustomTableViewCell"
    
    private let videoImage: UIImageView = {
        let videoImage = UIImageView()
        let image = UIImage(systemName: "heart")
        videoImage.translatesAutoresizingMaskIntoConstraints = false
        videoImage.image = image
        return videoImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
       }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        configureUI()
    }
    
    
    private func configureUI(){
        addSubViews(videoImage)
        NSLayoutConstraint.activate([
            videoImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            videoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            videoImage.widthAnchor.constraint(equalToConstant: 80),
            videoImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
