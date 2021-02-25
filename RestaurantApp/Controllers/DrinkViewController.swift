//
//  DrinkViewController.swift
//  RestaurantApp
//
//  Created by Alisher on 2/25/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class DrinkViewController: UIViewController {
    var drinks: [Product] = [
        Product(image: UIImage(named: "coca_cola"), title: "Coca Cola", description: "", price: 1.99),
        Product(image: UIImage(named: "espresso"), title: "Coffee Espresso", description: "", price: 3.99),
        Product(image: UIImage(named: "tea"), title: "Tea", description: "", price: 0.99),
        Product(image: UIImage(named: "bonaqua"), title: "Bonaqua", description: "", price: 0.99)
    ]
    
    @IBOutlet weak var drinkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        self.drinkCollectionView.delegate = self
        self.drinkCollectionView.dataSource = self
        self.drinkCollectionView.register(DrinkCollectionViewCell.nib, forCellWithReuseIdentifier: DrinkCollectionViewCell.identifier)
    }
}

extension DrinkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = drinkCollectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectionViewCell.identifier, for: indexPath) as! DrinkCollectionViewCell
        cell.title.text = drinks[indexPath.row].title
        cell.price.text = "Price: \(drinks[indexPath.row].price ?? 0)"
        cell.image.image = drinks[indexPath.row].image
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .gray
        }else{
            cell.backgroundColor = .yellow
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.pTitle = drinks[indexPath.row].title!
        vc.pDescription = drinks[indexPath.row].description!
        vc.pPrice = drinks[indexPath.row].price!
        vc.pImage = drinks[indexPath.row].image!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DrinkViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wid = (self.view.bounds.width - 10) / 2
        return CGSize(width: wid, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
