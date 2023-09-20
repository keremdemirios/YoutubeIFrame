// TO DO : Youtube linkinin sonundaki kisim ID olarka geciyor.
// TO DO : Anasayfada bir tane textfield yap ve arama ile video getir. Istege gore farkli sekilde yapabilirsin.
// TO DO : Video linkini nasil getirecegini bul.
//  YoutubeIFrameController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 19.09.2023.
//

import UIKit
import YouTubeiOSPlayerHelper

class ViewController: UIViewController {
    
    private let playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.layer.borderWidth = 1
        playerView.layer.borderColor = UIColor.label.cgColor
        playerView.layer.cornerRadius = 8
        return playerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    private func configure(){
        configureUI()
        getYoutubeView()
    }
    
    private func getYoutubeView(){
        self.playerView.load(withVideoId: "https://www.youtube.com/watch?v=WxR3CMyMl1c".getYoutubeId() ?? "Empty")
    }
    
    private func configureUI(){
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            playerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
