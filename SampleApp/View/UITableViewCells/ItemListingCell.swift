//
//  ItemListingCell.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import UIKit

class ItemListingCell: UITableViewCell {
    var scrollDirection = TypeOfDirection.horizontal
    let vm = DataVM()
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
     //   callApi()
    }
    func configureCell(itemImage: String, title: String) {
        
    }
//    func callApi() {
//        vm.callEventDetailAPI(id: SharedData.instance.getEventID()) { (success, message) in
//            if success {
//                print("***\(self.vm.eventDetails)")
//                print("***\(self.vm.eventDetails.eventName ?? "")")
//                self.collectionView.reloadData()
//            } else {
//                print(message)
//            }
//        }
//    }
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
        count = 10
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCell.className, for: indexPath) as? CategoryListCell {
            print("$$$$\(vm.dataModel?.homeData?.count)")
         //   cell.configureCell(image: vm.eventDetails.eventSponsors?[indexPath.row]?.sponsorLogo ?? "")
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
