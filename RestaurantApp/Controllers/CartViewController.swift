//
//  CartViewController.swift
//  RestaurantApp
//
//  Created by Alisher on 2/25/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

//var cartProducts = [Product]()

class CartViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    
    var cartItems = [Product]()
    var cartItem: Product?
    
    var itemTitle: String?
    var itemDesc: String?
    var itemPrice: Double?
    var itemImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if itemTitle != nil, itemDesc != nil, itemPrice != nil, itemImage != nil {
            cartItem = Product(image: itemImage, title: itemTitle, description: itemDesc, price: itemPrice)
        }
        
        if cartItem != nil {
            cartItems.append(cartItem!)
        }
        
        cartTableView.reloadData()
    }
    
    func configure() {
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.cartTableView.register(CartTableViewCell.nib, forCellReuseIdentifier: CartTableViewCell.identifier)
        cartTableView.tableFooterView = UIView()
    }
    
    @IBAction func buyAction(_ sender: Any) {
        var totalPrice: Double = 0.0
        cartItems.forEach { product in
            totalPrice = totalPrice + product.price!
        }
        
        let alertController = UIAlertController(title: "Operation", message: "Operation successfully finished. Total price is \(totalPrice)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.cartProductTitle?.text = cartItems[indexPath.row].title
        cell.cartProductPrice?.text = "Price: $\(cartItems[indexPath.row].price ?? 0)"
        cell.cartProductImage?.image = cartItems[indexPath.row].image
        return cell
    }
}
