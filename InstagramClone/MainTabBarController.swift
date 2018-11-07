//
//  MainTabBarController.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 9/15/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            let layout = UICollectionViewFlowLayout()
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
            let photoSelectorNavController = UINavigationController(rootViewController: photoSelectorController)
            present(photoSelectorNavController, animated: true, completion: nil)            
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        // if user not login
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        setupViewControllers()
    }
    
    func setupViewControllers() {
        // Home
        let homeNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "home_selected"), unselectedImage: #imageLiteral(resourceName: "home_unselected"), rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        // Search
        let searchNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "search_selected"), unselectedImage: #imageLiteral(resourceName: "search_unselected"), rootViewController: UserSearchController(collectionViewLayout: UICollectionViewFlowLayout()))
        // Plus
        let plusNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "plus_unselected"), unselectedImage: #imageLiteral(resourceName: "plus_unselected"))
        // Like
        let likeNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "like_selected"), unselectedImage: #imageLiteral(resourceName: "like_unselected"))
        // User Profile
        let userProfileNavController = templateNavController(selectedImage: #imageLiteral(resourceName: "profile_selected"), unselectedImage: #imageLiteral(resourceName: "profile_unselected"), rootViewController: UserProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        viewControllers = [homeNavController, searchNavController, plusNavController, likeNavController, userProfileNavController]

        tabBar.tintColor = UIColor.black
        // modify tab bar item insets
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(selectedImage: UIImage, unselectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
