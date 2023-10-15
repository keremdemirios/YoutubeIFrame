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
    
    private let moviesTableView: UITableView = {
        let moviesTableView = UITableView()
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.register(VideosCustomTableViewCell.self, forCellReuseIdentifier: VideosCustomTableViewCell.identifier)
        moviesTableView.backgroundColor = .systemBackground
        return moviesTableView
    }()
    
    var videoData = [ // video image :: video name
        ("pencil","Kerem"),
        ("trash","Kerem 1"),
        ("star","Kerem 2"),
        ("heart","Kerem 3"),
        ("heart.fill","Kerem 42"),
        ("star.fill","Kerem 5"),
        ("pencil","Kerem 6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Videos"
        configure()
    }
    
    private func configure() {
        configureUI()
    }
    
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

    }
}

extension VideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideosCustomTableViewCell.identifier, for: indexPath) as! VideosCustomTableViewCell
        let data = videoData[indexPath.row]
        cell.configureCell(withImage: data.0, withName: data.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = VideoPlayerViewController()
        vc.modalPresentationStyle = .automatic
        navigationController?.present(vc, animated: true)
    }
}
