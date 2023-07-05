
import Foundation
import UIKit
extension UITableView {
    
    func setupRefreshControl() -> UIRefreshControl? {
        
        var refreshControl: UIRefreshControl?
        refreshControl = UIRefreshControl()
        
        if let refControl = refreshControl {
            
            refControl.backgroundColor = .clear
            refControl.tintColor = UIColor.blue
            addSubview(refControl)
            return refControl
        }
        return nil
    }
    static func emptyCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollToBottom(animated: Bool = true) {
        DispatchQueue.main.async {
            var yOffset: CGFloat = 0.0;
            if (self.contentSize.height > self.bounds.size.height) {
                yOffset = self.contentSize.height - self.bounds.size.height;
            }
            self.setContentOffset(CGPoint(x: 0, y: yOffset), animated: animated)
        }
    }
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
