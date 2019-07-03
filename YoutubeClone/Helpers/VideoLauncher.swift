//
//  VideoLauncher.swift
//  YoutubeClone
//
//  Created by Omar Thamri on 03/07/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        let urlString = "http://localhost/harvey_specter.mp4"
        if let url = URL(string: urlString) {
        let player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            player.play()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("show video player animation")
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10))
            view.backgroundColor = UIColor.white
            // 9 * 16 is aspect ratio of all HD videos
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerView = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height))
            view.addSubview(videoPlayerView)
            keyWindow.addSubview(view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
            }, completion:{ (completedAnimation) in
            
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            })
        }
    }
    
    
}
