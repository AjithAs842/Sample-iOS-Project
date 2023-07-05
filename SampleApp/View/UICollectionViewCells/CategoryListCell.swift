//
//  CategoryListCell.swift
//  SampleApp
//
//  Created by Rony Sebastian on 05/07/23.
//

import UIKit

class CategoryListCell: UICollectionViewCell {

    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = imgView.bounds.height / 5
        imgView.mask?.clipsToBounds = true
        // Initialization code
    }

}
