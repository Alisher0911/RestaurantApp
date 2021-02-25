//
//  FoodCollectionViewCell.swift
//  RestaurantApp
//
//  Created by Alisher on 2/25/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    static let identifier = String(describing: FoodCollectionViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
