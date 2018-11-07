//
//  UserSearchCell.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 10/14/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit

class UserSearchCell: UICollectionViewCell {
    
    var user: User? {
        didSet{
            userNameLabel.text = user?.username
            guard let profileImageUrl = user?.profileImageUrl else { return }
            userProfileImageView.loadImage(urlSrting: profileImageUrl)
        }
    }
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50/2
        
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let lbl = UILabel()
        let attributedText = NSMutableAttributedString(string: "Username\n\n", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: "12 Posts", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))

        lbl.attributedText = attributedText
        lbl.numberOfLines = 0

        return lbl
    }()
    
    let spliterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(userProfileImageView)
        userProfileImageView.anchor(top: nil, bottom: nil, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 50, height: 50)
        userProfileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(userNameLabel)
        userNameLabel.anchor(top: topAnchor, bottom: bottomAnchor, left: userProfileImageView.rightAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 0, height: 0)
        
        addSubview(spliterView)
        spliterView.anchor(top: nil, bottom: bottomAnchor, left: userNameLabel.leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
