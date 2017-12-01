//
//  DemoViewController.swift
//  AppStore iOS 10
//
//  Created by Itai Asaf on 30/11/2017.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class DemoViewController: UIViewController {
    
    var playingUrl: String!
    
    override func viewDidLoad() {
        if let urlvid = URL(string: self.playingUrl!) {
            let player = AVPlayer(url: urlvid)
            let playerController = AVPlayerViewController()
            
            playerController.player = player
            self.addChildViewController(playerController)
            self.view.addSubview(playerController.view)
            playerController.view.frame = self.view.frame
            
            player.play()
        } else {
            self .dismiss(animated: true, completion: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
}


