
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
        tabBarController.tabBar.tintColor = UIColor.gray
        tabBarController.tabBar.backgroundColor = .white
        v1?.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "hut"), selectedImage: UIImage(named: "hut"))
        v2?.tabBarItem = UITabBarItem.init(title: "Categories", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu"))
        v3?.tabBarItem = UITabBarItem.init(title: "Offers", image: UIImage(named: "discount"), selectedImage: UIImage(named: "discount"))
        v4?.tabBarItem = UITabBarItem.init(title: "Cart", image: UIImage(named: "shopping-cart"), selectedImage: UIImage(named: "shopping-cart"))
        v5?.tabBarItem = UITabBarItem.init(title: "Account", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
            
        tabBarController.viewControllers = [(v1 ?? UIViewController()), (v2 ?? UIViewController()), (v3 ?? UIViewController()), (v4 ?? UIViewController()), (v5 ?? UIViewController())]
        
        return tabBarController
    }
}
