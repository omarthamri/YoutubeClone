//
//  ViewController.swift
//  YoutubeClone
//
//  Created by MACBOOK PRO RETINA on 23/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let CellId = "CellId"
    var videos: [Video] = {
        var myChannel = Channel()
        myChannel.name = "omar"
        myChannel.profileImageName = "me"
       var blankSpaceVideo = Video()
        blankSpaceVideo.thumbnailImageName = "taylor_swift"
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.numberOfViews = 1482779108
        
        blankSpaceVideo.channel = myChannel
        var badBloodVideo = Video()
        badBloodVideo.thumbnailImageName = "taylorswift_badblood"
        badBloodVideo.title = "Taylor Swift - Bad Blood feat Kendrick Lamar"
        badBloodVideo.channel = myChannel
        badBloodVideo.numberOfViews = 2222175634
        return [blankSpaceVideo,badBloodVideo]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20 )
        navigationItem.titleView = titleLabel
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell .self, forCellWithReuseIdentifier: CellId)
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(handleSearch))
        searchBarButtonItem.tintColor = UIColor.white
        let moreBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(handleMore))
        moreBarButtonItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
    }
    
    @objc func handleMore() {
        
    }
    
    @objc func handleSearch() {
        print("clicked")
    }
    
    let menuBar: MenuBar = {
       let mb = MenuBar()
        return mb
    }()
    
    func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}



