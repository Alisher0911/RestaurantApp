//
//  CartTableViewCell.swift
//  RestaurantApp
//
//  Created by Alisher on 2/26/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var cartProductImage: UIImageView!
    @IBOutlet weak var cartProductTitle: UILabel!
    @IBOutlet weak var cartProductPrice: UILabel!
    
    static let identifier = String(describing: CartTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
