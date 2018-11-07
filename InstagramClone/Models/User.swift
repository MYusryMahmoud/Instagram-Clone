//
//  User.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 10/4/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit

struct User {
    let uid: String?
    let username: String?
    let profileImageUrl: String?
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
