//
//  Post.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 9/29/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit

struct Post {
    let user: User
    let imageUrl: String
    let caption: String
    let creationDate: Date
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
    }
}
