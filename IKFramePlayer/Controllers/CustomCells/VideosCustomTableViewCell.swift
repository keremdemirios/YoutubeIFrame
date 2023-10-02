//
//  VideosCustomTableViewCell.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 2.10.2023.
//

import UIKit

class VideosCustomTableViewCell: UITableViewCell {
    static let identifier = "VideosCustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        configureUI()
    }
    
    
    private func configureUI(){
        
    }
}
