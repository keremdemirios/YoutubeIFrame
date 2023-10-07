//
//  VideosCustomTableViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 2.10.2023.
//

import UIKit

class VideosCustomTableViewCell: UITableViewCell {
    static let identifier = "VideosCustomTableViewCell"
    
    public var videoImage: UIImageView = {
        let videoImage = UIImageView()
        videoImage.translatesAutoresizingMaskIntoConstraints = false
        return videoImage
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
//        configureUI()
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
    
    func configureImageView(withImage image: UIImage?){
        videoImage.image = image
    }
}
