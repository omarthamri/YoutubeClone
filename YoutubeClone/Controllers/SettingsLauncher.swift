//
//  SettingsLauncher.swift
//  YoutubeClone
//
//  Created by Omar Thamri on 27/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class Setting: NSObject {
    var name: String
    var imageName: String
    init(name: String,imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class SettingsLauncher: NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let settings: [Setting] = {
        return [Setting(name: "Settings", imageName: "settings"),Setting(name: "Terms & privacy policy", imageName: "privacy"),Setting(name: "Send feedback", imageName: "feedback"),Setting(name: "Help", imageName: "help"),Setting(name: "Switch account", imageName: "switch_account"),Setting(name: "Cancel", imageName: "cancel")]
    }()
    let cellHeight = 50
    let blackView = UIView()
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    @objc func showSettings () {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            window.addSubview(collectionView)
            let y = window.frame.height - CGFloat(self.cellHeight * self.settings.count)
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: CGFloat(self.cellHeight * self.settings.count))
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: CGFloat(self.cellHeight * self.settings.count))
            }, completion: nil)
        }
        
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: CGFloat(self.cellHeight * self.settings.count))
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingsCell
        cell.setting = settings[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(settings[indexPath.item].name)
        handleDismiss()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: CGFloat(cellHeight))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
}
