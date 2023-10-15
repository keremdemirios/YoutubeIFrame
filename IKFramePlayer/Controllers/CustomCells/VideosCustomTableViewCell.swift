//
//  VideosCustomTableViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 2.10.2023.
//

import UIKit

class VideosCustomTableViewCell: UITableViewCell {
    static let identifier = "VideosCustomTableViewCell"
    
    lazy var videoImage: UIImageView = {
        var videoImage = UIImageView()
        videoImage.translatesAutoresizingMaskIntoConstraints = false
        videoImage.contentMode = .scaleAspectFit
        videoImage.image = nil
        return videoImage
    }()
    
    public var movieName:UILabel = {
        let movieName = UILabel()
        movieName.translatesAutoresizingMaskIntoConstraints = false
        movieName.text = nil
        movieName.sizeToFit()
        return movieName
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
//        translatesAutoresizingMaskIntoConstraints = false
        configureUI()
    }
    
    
    func configureUI(){
        addSubViews(videoImage, movieName)
        NSLayoutConstraint.activate([
            // constraint video image
            videoImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            videoImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            videoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            videoImage.widthAnchor.constraint(equalToConstant: 120),
            
            // constraint movie Name
            movieName.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieName.leadingAnchor.constraint(equalTo: videoImage.trailingAnchor, constant: 50)
        ])
    }
    
    
    
    func configureCell(withImage image: String, withName name: String){
        videoImage.image = UIImage(named: image)
        movieName.text = name
    }
}
