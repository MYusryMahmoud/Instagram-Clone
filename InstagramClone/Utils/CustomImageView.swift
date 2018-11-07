//
//  CustomImageView.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 10/4/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit

var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {
    
    var lastUrlUsedToLoadImage: String?
    
    func loadImage(urlSrting: String) {
        lastUrlUsedToLoadImage = urlSrting
        
        self.image = nil
        
        if let cachedImage = imageCache[urlSrting] {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlSrting) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            if let err = err {
                print("Failed to fetch profile image:", err)
                return
            }
            
            if url.absoluteString != self.lastUrlUsedToLoadImage {
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            imageCache[url.absoluteString] = image
            
            DispatchQueue.main.async {
                self.image = image
            }
        }).resume()
    }
    
}
