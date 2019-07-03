//
//  ApiService.swift
//  YoutubeClone
//
//  Created by Omar Thamri on 29/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchFeedUrlString(urlString: String, completion: @escaping  ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            do {
                if let unwrappedData = data, let json = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String:AnyObject]] {
                       /* var videos = [Video]()
                        for dictionnary in json  {
                            let video = Video(dictionnary: dictionnary)
                            videos.append(video)
                        }*/
                    let videos = json.map({return Video(dictionnary: $0)})
                        DispatchQueue.main.async {
                            completion(videos)
                        }
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
    

}




/*
 func fetchFeedUrlString(urlString: String, completion: @escaping  ([Video]) -> ()) {
 let url = URL(string: urlString)
 URLSession.shared.dataTask(with: url!) { (data, response, error) in
 if error != nil {
 print(error)
 return
 }
 do {
 let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
 var videos = [Video]()
 for dictionnary in json as! [[String:AnyObject]] {
 let video = Video()
 video.title = dictionnary["title"] as? String
 video.thumbnailImageName = dictionnary["thumbnail_image_name"] as? String
 video.numberOfViews = dictionnary["number_of_views"] as? NSNumber
 let channelDictionnary = dictionnary["channel"] as! [String: AnyObject]
 let channel = Channel()
 channel.name = channelDictionnary["name"] as? String
 channel.profileImageName = channelDictionnary["profile_image_name"] as? String
 video.channel = channel
 videos.append(video)
 
 }
 DispatchQueue.main.async {
 completion(videos)
 }
 
 } catch let jsonError {
 print(jsonError)
 }
 
 
 }.resume()
 }
 */
