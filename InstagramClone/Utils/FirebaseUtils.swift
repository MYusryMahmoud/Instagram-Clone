
//
//  Firebase Utils.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 10/10/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import Foundation
import Firebase

extension Database {
    static func fetchUserWithUid(uid: String, completion: @escaping (User) -> ()) {
        let userRef = Database.database().reference().child("users").child(uid)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }) { (err) in
            print("Failed to fetch posts: ", err)
        }
    }
}
