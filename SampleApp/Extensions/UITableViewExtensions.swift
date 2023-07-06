
import Foundation
import UIKit
extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        if traitCollection.userInterfaceStyle == .dark {
            messageLabel.textColor = UIColor.blue
        } else {
            messageLabel.textColor = UIColor.blue
        }
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Poppins-Bold", size: 17)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none// .singleLine
    }
}
