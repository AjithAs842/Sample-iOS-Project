
import UIKit
import SDWebImage

class CategoryListCell: UICollectionViewCell {

    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = imgView.bounds.height / 5
        imgView.mask?.clipsToBounds = true
        
    }
    func configureCell(img: String, title: String) {
        imgCategory.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.imgCategory.sd_setImage(with: URL(string: img), placeholderImage: nil, options: .scaleDownLargeImages, context: nil, progress: .none) { (image, error, _, _) in
            if error != nil {
                self.imgCategory.image = UIImage(named: "")
            } else {
                self.imgCategory.image = image
            }
        }
        titleLabel.text = title
        imgView.backgroundColor = ColorSet.ColorArray.randomElement()
        
    }
}
