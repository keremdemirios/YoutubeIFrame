// TO DO : Anasayfada bir tane textfield yap ve arama ile video getir. Istege gore farkli sekilde yapabilirsin.
// TO DO : Video linkini nasil getirecegini bul.
//  YoutubeIFrameController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 19.09.2023.
//

// MARK : Youtube API Key = AIzaSyC4_EguAvNx1y7t_fNUBxPbj4NwrmSnqQw

import UIKit
import YouTubeiOSPlayerHelper

class VideosViewController: UIViewController {
    
    private let playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.layer.borderWidth = 1
        playerView.layer.borderColor = UIColor.label.cgColor
        playerView.layer.cornerRadius = 8
        return playerView
    }()
    
    private let moviesTableView: UITableView = {
        let moviesTableView = UITableView()
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.register(VideosCustomTableViewCell.self, forCellReuseIdentifier: VideosCustomTableViewCell.identifier)
        moviesTableView.backgroundColor = .systemBackground
        return moviesTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Videos"
        configure()
    }
    
    private func configure(){
        configureUI()
//        getYoutubeView()
    }
    
//    private func getYoutubeView(){
//        self.playerView.load(withVideoId: "https://www.youtube.com/watch?v=WxR3CMyMl1c".getYoutubeId() ?? "Empty Url")
//
//    }
    
    private func configureUI(){
        // table view delegates
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        view.addSubViews(moviesTableView)
        NSLayoutConstraint.activate([
            moviesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
//        view.addSubview(playerView)
//        NSLayoutConstraint.activate([
//            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            playerView.heightAnchor.constraint(equalToConstant: 250)
//        ])
    }
}

extension VideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideosCustomTableViewCell.identifier, for: indexPath) as! VideosCustomTableViewCell
//        cell.textLabel?.text = "Kerem Demir"
//        cell.textLabel?.textAlignment = .center
        let image = UIImage(systemName: "heart")
        cell.configureImageView(withImage: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
