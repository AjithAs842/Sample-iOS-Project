

import Foundation
import UIKit
// MARK: - TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = vm.getItem(index: indexPath.row)
        if item.itemType == ItemsCellType.search.rawValue {
            return screenHeight * 0.065
        } else if item.itemType == ItemsCellType.category.rawValue {
            return screenHeight * 0.125
        } else if item.itemType == ItemsCellType.banner.rawValue {
            return screenHeight * 0.27
        } else if item.itemType == ItemsCellType.products.rawValue {
            return screenHeight * 0.325
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = vm.getItem(index: indexPath.row)
        if item.itemType == ItemsCellType.search.rawValue {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.className, for: indexPath) as? SearchCell {
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        } else if item.itemType == ItemsCellType.category.rawValue{
            if let cell = tableView.dequeueReusableCell(withIdentifier: ItemListingCell.className, for: indexPath) as? ItemListingCell {
                cell.selectionStyle = .none
                cell.categoryViewData =  self.vm.filterValuesByType(data: self.vm.dataModel ?? Datas(), type: ItemsCellType.category.rawValue)
                cell.collectionView.reloadData()
                return cell
            }
            return UITableViewCell()
        } else if item.itemType == ItemsCellType.banner.rawValue{
            if let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.className, for: indexPath) as? BannerCell {
                cell.selectionStyle = .none
                cell.bannerImages =  self.vm.filterValuesByType(data: self.vm.dataModel ?? Datas(), type: ItemsCellType.banner.rawValue)
                cell.collectionView.reloadData()
                return cell
            }
            return UITableViewCell()
        } else if item.itemType == ItemsCellType.products.rawValue {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.className, for: indexPath) as? ProductsCell {
                cell.selectionStyle = .none
                cell.productValues =  self.vm.filterValuesByType(data: self.vm.dataModel ?? Datas(), type: ItemsCellType.products.rawValue)
                cell.collectionView.reloadData()
                return cell
            }
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
// MARK: - Keyboard Delegate Functions
extension ViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
