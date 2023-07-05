//
//  TabbarProvider.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import Foundation

import UIKit
import Foundation
enum TabbarProvider {
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        let v1 = mainStory.instantiateViewController(withIdentifier: ViewController.className) as? ViewController
        let v2 = mainStory.instantiateViewController(withIdentifier: CategoryVC.className) as? CategoryVC
        let v3 = mainStory.instantiateViewController(withIdentifier: OfferVC.className) as? OfferVC
        let v4 = mainStory.instantiateViewController(withIdentifier: CartVC.className) as? CartVC
        let v5 = mainStory.instantiateViewController(withIdentifier: AccountVC.className) as? AccountVC
        tabBarController.tabBar.tintColor = UIColor.lightGray
        tabBarController.tabBar.backgroundColor = .white
        v1?.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "sunIcons"), selectedImage: UIImage(named: "AsunIcons"))
        v2?.tabBarItem = UITabBarItem.init(title: "Categories", image: UIImage(named: "file"), selectedImage: UIImage(named: "Afile"))
        v3?.tabBarItem = UITabBarItem.init(title: "Offers", image: UIImage(named: "chatIcons"), selectedImage: UIImage(named: "AchatIcons"))
        v4?.tabBarItem = UITabBarItem.init(title: "Cart", image: UIImage(named: "giftIcons"), selectedImage: UIImage(named: "AgiftIcons"))
        v5?.tabBarItem = UITabBarItem.init(title: "Account", image: UIImage(named: "userIcons"), selectedImage: UIImage(named: "AuserIcons"))
        
//     UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: UIColor.init(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0))
//        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 50, height: 1)
//        tabBarController.tabBar.layer.shadowRadius = 2
//        tabBarController.tabBar.layer.shadowColor = UIColor.black.cgColor
//        tabBarController.tabBar.layer.shadowOpacity = 0.3
            
        tabBarController.viewControllers = [(v1 ?? UIViewController()), (v2 ?? UIViewController()), (v3 ?? UIViewController()), (v4 ?? UIViewController()), (v5 ?? UIViewController())]
        
        return tabBarController
    }
}
