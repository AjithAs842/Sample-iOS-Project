
import UIKit

class ViewController: UIViewController{
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupUI()
    }
    
 
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    let vm = DataVM()
    
    // MARK: - ViewController Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         self.setupUI()
    }
    // MARK: - Custom Methods
    func setupUI() {
        vm.initializeData()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: SearchCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchCell.className)
        let nib1 = UINib(nibName: ItemListingCell.className, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: ItemListingCell.className)
        let nib2 = UINib(nibName: BannerCell.className, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: BannerCell.className)
        let nib3 = UINib(nibName: ProductsCell.className, bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: ProductsCell.className)
        setupToHideKeyboardOnTapOnView()
        setupData()
        tableView.separatorStyle = .none
     
    }
    func setupData() {
        setUPAPI()
    }
    func setUPAPI() {
        if Reachability.isConnectedToNetwork() {
            vm.callAPI{ (success, message) in
                if success == "0" {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(title: ErrorMessage.networkError, message: ErrorMessage.Apierror)
                        self.tableView.setEmptyMessage("NO DATA AVAILABLE....!")
                    }
                }
            }
        } else {
            showAlert(title: ErrorMessage.networkError, message: ErrorMessage.noNetwork)
        }
    }
}
