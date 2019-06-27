//
//  SettingsLauncher.swift
//  YoutubeClone
//
//  Created by Omar Thamri on 27/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    let blackView = UIView()
    
    @objc func showSettings () {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
        
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
    
    override init() {
        super.init()
    }
    
    
}
