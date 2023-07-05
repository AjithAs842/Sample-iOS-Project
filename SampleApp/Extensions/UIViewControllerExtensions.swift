//
//  UIViewControllerExtensions.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//
import Foundation
import UIKit
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            // Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
