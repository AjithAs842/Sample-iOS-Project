//
//  Approuter.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import Foundation
import UIKit
class AppRouter {
    class func landOnSutableVC() {
                  landingOnHomeVC()
    }
 
    class func landingOnHomeVC() {
        let navigationController = UINavigationController(rootViewController: TabbarProvider.systemStyle() )
        navigationController.setNavigationBarHidden(true, animated: false)
            if #available(iOS 13.0, *) {
                sceneDelegate?.window?.rootViewController = navigationController
            } else {
                appDelegate?.window?.rootViewController = navigationController
            }
        }
   
}
