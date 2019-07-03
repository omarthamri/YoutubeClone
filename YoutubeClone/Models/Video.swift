//
//  Video.swift
//  YoutubeClone
//
//  Created by MACBOOK PRO RETINA on 25/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class safeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let uppercasedFirstCharacter = String(key.characters.first!).uppercased()
        let range = key.startIndex...key.index(key.startIndex, offsetBy: 0)
        let selectorString = key.replacingCharacters(in: range, with: uppercasedFirstCharacter)
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        if !responds {
            return
        }
        super.setValue(value, forKey: key)
    }
}

@objcMembers
class Video: safeJsonObject {
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
class Channel: safeJsonObject {
    var name: String?
    var profile_image_name: String?
}
