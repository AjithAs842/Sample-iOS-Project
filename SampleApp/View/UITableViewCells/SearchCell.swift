

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.borderWidth = 0.5
        self.mainView.layer.borderColor = UIColor.gray.cgColor
        self.mainView.layer.cornerRadius = 5
        self.mainView.mask?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
