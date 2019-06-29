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
    var videos: [Video]?

    func fetchVideos() {
        let url = URL(string: "http://localhost/home.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                self.videos = [Video]()
                for dictionnary in json as! [[String:AnyObject]] {
                    let video = Video()
                    video.title = dictionnary["title"] as? String
                    video.thumbnailImageName = dictionnary["thumbnail_image_name"] as? String
                    let channelDictionnary = dictionnary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channelDictionnary["name"] as? String
                    channel.profileImageName = channelDictionnary["profile_image_name"] as? String
                    video.channel = channel
                    self.videos?.append(video)
                    
                }
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideos()
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
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
    
    lazy var settingLauncher: SettingsLauncher = {
       let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
        settingLauncher.showSettings()
    }
    
    func showControllerForSettings(setting: Setting) {
        let newSettingsViewController = UIViewController()
        newSettingsViewController.navigationItem.title = setting.name.rawValue
        newSettingsViewController.view.backgroundColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.pushViewController(newSettingsViewController, animated: true)
    }
    
    @objc func handleSearch() {
        print("clicked")
    }
    
    let menuBar: MenuBar = {
       let mb = MenuBar()
        return mb
    }()
    
    func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: redView)
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        menuBar.topAnchor .constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
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



