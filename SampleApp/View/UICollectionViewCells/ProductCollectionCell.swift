//
//  ProductCollectionCell.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
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
        self.lblAdd.layer.cornerRadius = 5
        self.lblAdd.mask?.clipsToBounds = true
        
    }

}
