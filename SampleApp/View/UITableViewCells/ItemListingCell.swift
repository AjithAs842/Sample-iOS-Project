
import UIKit

class ItemListingCell: UITableViewCell {
    var scrollDirection = TypeOfDirection.horizontal
    let vm = DataVM()
    var categoryViewData: [Value] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib1 = UINib(nibName: CategoryListCell.className, bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: CategoryListCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        if scrollDirection == .horizontal {
            createHorizontalLayout()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
// MARK: - CollectionView Delegate/Datasource Functions
extension ItemListingCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = Int()
        count = categoryViewData.count
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCell.className, for: indexPath) as? CategoryListCell {
                cell.configureCell(img: categoryViewData[indexPath.row].imageURL ?? "", title: categoryViewData[indexPath.row].name ?? "")
                return cell
        }
        return UICollectionViewCell()
    }

}
extension ItemListingCell: CollectionViewDelegateHorizontalGridLayout {
    
     func createHorizontalLayout() {
         let layout = CollectionViewHorizontalGridLayout()
         collectionView.collectionViewLayout = layout
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, numberOfRowsForSection section: Int) -> Int {
         return 1
     }
     // MARK: - Width
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, widthForItemAt indexPath: IndexPath, rowHeight: CGFloat) -> CGFloat {
         return screenWidth / 3.65
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, weightForRow column: Int, inSection section: Int) -> CGFloat {
         return screenWidth / 15
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnSpacingForSection section: Int) -> CGFloat {
         return screenWidth * 0.001
     }
}
