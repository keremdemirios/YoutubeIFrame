// TO DO : Anasayfada bir tane textfield yap ve arama ile video getir. Istege gore farkli sekilde yapabilirsin.
// TO DO : Video linkini nasil getirecegini bul.
// TO DO : Resim gelmiyor getir.
//  YoutubeIFrameController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 19.09.2023.
//

// MARK : Youtube API Key = AIzaSyC4_EguAvNx1y7t_fNUBxPbj4NwrmSnqQw

import UIKit
import YouTubeiOSPlayerHelper
import SDWebImage

class VideosViewController: UIViewController {
    
    private let moviesTableView: UITableView = {
        let moviesTableView = UITableView()
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.register(VideosCustomTableViewCell.self, forCellReuseIdentifier: VideosCustomTableViewCell.identifier)
        moviesTableView.backgroundColor = .systemBackground
        return moviesTableView
    }()
    
    var videoData = [Result]()
    
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
        fetchData()
    }
    
    // API KEY = 9d4e2bb4b5c9913f7dfecec00f852fc2
    func fetchData(){
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=9d4e2bb4b5c9913f7dfecec00f852fc2")!
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Error at shared data task.")
                return
            }
            do{
                let jsonData = try JSONDecoder().decode(MovieDataModel.self, from: data)
                videoData = jsonData.results
                
                DispatchQueue.main.async {
                    self.moviesTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

extension VideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideosCustomTableViewCell.identifier, for: indexPath) as! VideosCustomTableViewCell
        let data = videoData[indexPath.row]
        let imageAdress = "\(NetworkConstant.shared.imageServerAdress)\(data.posterPath)"

        DispatchQueue.main.async {
            cell.configureCell(withImage: imageAdress, withName: data.title)
            print(imageAdress)
        }
        
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
