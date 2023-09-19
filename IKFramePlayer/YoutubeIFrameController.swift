//
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
        self.playerView.load(withVideoId: "M7lc1UVf-VE")
        
    }
}
