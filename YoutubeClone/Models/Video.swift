//
//  Video.swift
//  YoutubeClone
//
//  Created by MACBOOK PRO RETINA on 25/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

@objcMembers
class Video: NSObject {
     var thumbnail_image_name: String?
     var title: String?
     var number_of_views: NSNumber?
     var uploadDate: NSDate?
     var channel: Channel?
     var duration: NSNumber?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            self.channel = Channel()
             self.channel?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
     init(dictionnary: [String: AnyObject]) {
        super.init()
        self.setValuesForKeys(dictionnary)
    }
    
}

@objcMembers
class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}
