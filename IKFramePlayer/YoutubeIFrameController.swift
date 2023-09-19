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

class YoutubeIFrameController: UIViewController {

    @IBOutlet weak var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerView.load(withVideoId: "jBryHOdyx_k")
    }
}
