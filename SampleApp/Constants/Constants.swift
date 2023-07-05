//
//  Constants.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import Foundation
import UIKit
var appDelegate = UIApplication.shared.delegate as? AppDelegate
@available(iOS 13.0, *)
let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
struct ErrorMessage {
    static let networkError = "Network Error"
    static let noNetwork = "No Internet Connection.Please Try Again Later!"
    static let Apierror = "Whoops! There Seems To Be Some Server Issue"
}
let screenWidth  = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
struct ColorSet {
    static let serachBorder = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 0.8757174745)
    
    static let itemC1 = #colorLiteral(red: 0.9803921569, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
    static let itemC2 = #colorLiteral(red: 0.4784313725, green: 0.6778761527, blue: 0.6800956396, alpha: 1)
    static let itemC3 = #colorLiteral(red: 0.7196514423, green: 0.7568627596, blue: 0.5, alpha: 0.5563616071)
    static let itemC4 = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    static let ColorArray = [itemC1,itemC2,itemC4,itemC3]
  
    
}
enum TypeOfDirection {
    case vertical, horizontal
}
