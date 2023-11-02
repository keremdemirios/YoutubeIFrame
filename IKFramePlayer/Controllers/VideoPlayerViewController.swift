//
//  VideoPlayerViewController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 7.10.2023.
//

import UIKit
import YouTubeiOSPlayerHelper

class VideoPlayerViewController: UIViewController {

    // MARK : UI Elements
    private let playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.layer.borderWidth = 1
        playerView.layer.borderColor = UIColor.label.cgColor
        playerView.layer.cornerRadius = 8
        return playerView
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
        getYoutubeView()
    }
    // MARK : Setup UI
    private func setupUI(){
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            playerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func getYoutubeView(){
        self.playerView.load(withVideoId: "https://www.youtube.com/watch?v=WxR3CMyMl1c".getYoutubeId() ?? "Empty Url")
    }

    // MARK : Functions
    
    // MARK : Actions


}
