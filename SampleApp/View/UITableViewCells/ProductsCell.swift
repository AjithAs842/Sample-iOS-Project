

import UIKit

class ProductsCell: UITableViewCell{
    let vm = DataVM()
    var scrollDirection = TypeOfDirection.horizontal
    var productValues: [Value] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib1 = UINib(nibName: ProductCollectionCell.className, bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: ProductCollectionCell.className)
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
extension ProductsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productValues.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.className, for: indexPath) as? ProductCollectionCell)!
        cell.configureCell(img: productValues[indexPath.row].image ?? "", name: productValues[indexPath.row].name ?? "", actualPrice: productValues[indexPath.row].actualPrice ?? "", offerPrice: productValues[indexPath.row].offerPrice ?? "", offer: productValues[indexPath.row].offer ?? Int(), isExpress: productValues[indexPath.row].isExpress ?? Bool())
       
            return cell
    }
}
extension ProductsCell: CollectionViewDelegateHorizontalGridLayout {
    
    func createHorizontalLayout1() {
        let layout = CollectionViewHorizontalGridLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, numberOfRowsForSection section: Int) -> Int {
        return 1
    }
    // MARK: - Width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, widthForItemAt indexPath: IndexPath, rowHeight: CGFloat) -> CGFloat {
       
        return screenWidth / 2.25
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, weightForRow column: Int, inSection section: Int) -> CGFloat {
        return screenWidth / 11
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnSpacingForSection section: Int) -> CGFloat {
        return screenWidth * 0.008
    }
}

