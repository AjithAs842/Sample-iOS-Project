

import Foundation
import UIKit



struct Items {
    let title: String
    let itemType: String
}

enum ItemsCellType: String {
    case search = "Serach"
    case category = "Category"
    case banner = "Banner"
    case products = "Products"
}
class DataVM {
    var isPullToRefresh = false
   
    var data: [Items] = []
    var dataModel: Datas?
    
    init() {
    }
    func initializeData() {
        data.removeAll()
        data.append(Items(title: ItemsCellType.search.rawValue, itemType: ItemsCellType.search.rawValue))
        data.append(Items(title: ItemsCellType.category.rawValue, itemType: ItemsCellType.category.rawValue))
        data.append(Items(title: ItemsCellType.banner.rawValue, itemType: ItemsCellType.banner.rawValue))
        data.append(Items(title: ItemsCellType.products.rawValue, itemType: ItemsCellType.products.rawValue))
        
    }
    func numberOfItems() -> Int {
        return data.count
    }
    func getItem(index: Int) -> Items {
        return data[index]
    }
    func callAPI( completion: @escaping ((_ status: String, _ message: String) -> Void)) {
        
        let urls = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        ApiResource().getAPIsWithoutToken(url: urls) { [self] (status, response, error, data) in
            print("**\(String(describing: response))")
            print("**\(String(describing: error))")
            self.dataModel = try? JSONDecoder().decode(Datas.self, from: data ?? Data())
            if let JSONString = String(data: data ?? Data(), encoding: String.Encoding.utf8) {
                print("!!\(JSONString)")
                if status == 200 {
                    completion("0", "Success")
                } else {
                    completion("1", "Something Went Wrong")
                }
            }
        }
    }
}
