

import UIKit
import SDWebImage

class ProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblStrike: UILabel!
    @IBOutlet weak var imgDeliveryTruck: UIImageView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lblFlag: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.viewContent.layer.borderWidth = 0.5
        self.viewContent.layer.borderColor = UIColor.lightGray.cgColor
        self.viewContent.layer.cornerRadius = 5
        self.viewContent.mask?.clipsToBounds = true
        self.lblAdd.layer.cornerRadius = 10
        self.lblAdd.mask?.clipsToBounds = true
        
    }
    func configureCell(img: String, name: String, actualPrice: String, offerPrice: String, offer: Int, isExpress: Bool) {
        if isExpress {
            imgDeliveryTruck.isHidden = true
        } else {
            imgDeliveryTruck.isHidden = false
        }
        lblStrike.text = actualPrice
        
        let attributedText = NSAttributedString(string: lblStrike.text ?? "")
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSAttributedString(string: lblStrike.text ?? "", attributes: attributes)
        lblStrike.attributedText = attributedString
        lblItem.text = name
        
        itemImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.itemImage.sd_setImage(with: URL(string: img), placeholderImage: nil, options: .scaleDownLargeImages, context: nil, progress: .none) { (image, error, _, _) in
            if error != nil {
                self.itemImage.image = UIImage(named: "")
            } else {
                self.itemImage.image = image
            }
        }
        if offer > 0 {
            lblFlag.text = "\(offer)%OFF"
        } else {
            lblStrike.isHidden = true
            lblFlag.isHidden = true
            imgFlag.isHidden = true
        }
        lblAmount.text = offerPrice
    }

}
