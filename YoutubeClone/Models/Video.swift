//
//  Video.swift
//  YoutubeClone
//
//  Created by MACBOOK PRO RETINA on 25/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
