

import UIKit

class BannerCell: UITableViewCell{
    let vm = DataVM()
    var bannerImages: [Value] = []
    var scrollDirection = TypeOfDirection.horizontal
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib1 = UINib(nibName: BannerCollectionCell.className, bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: BannerCollectionCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        if scrollDirection == .horizontal {
            createHorizontalLayout1()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension BannerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.className, for: indexPath) as? BannerCollectionCell)!
        cell.configureCell(img: bannerImages[indexPath.row].bannerURL ?? "")
            return cell
    }
}
extension BannerCell: CollectionViewDelegateHorizontalGridLayout {
    
    func createHorizontalLayout1() {
        let layout = CollectionViewHorizontalGridLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, numberOfRowsForSection section: Int) -> Int {
        return 1
    }
    // MARK: - Width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, widthForItemAt indexPath: IndexPath, rowHeight: CGFloat) -> CGFloat {
       
        return screenWidth / 1.15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, weightForRow column: Int, inSection section: Int) -> CGFloat {
        return screenWidth / 11
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnSpacingForSection section: Int) -> CGFloat {
        return screenWidth * 0.008
    }
}

