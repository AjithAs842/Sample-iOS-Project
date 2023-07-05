
import UIKit
import SDWebImage

class BannerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(img: String) {
        bannerImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.bannerImage.sd_setImage(with: URL(string: img), placeholderImage: nil, options: .scaleDownLargeImages, context: nil, progress: .none) { (image, error, _, _) in
            if error != nil {
                self.bannerImage.image = UIImage(named: "")
            } else {
                self.bannerImage.image = image
            }
        }
    }
}
