//
//  FoodViewController.swift
//  RestaurantApp
//
//  Created by Alisher on 2/25/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    var foods: [Product] = [
        Product(image: UIImage(named: "flank_stejk"), title: "Flank Steak", description: "", price: 3.99),
        Product(image: UIImage(named: "rub_bif"), title: "Chopped steak", description: "", price: 4.99),
        Product(image: UIImage(named: "utin_file"), title: "Duck fillet", description: "", price: 2.99),
        Product(image: UIImage(named: "kur_file_gril"), title: "Grilled chicken fillet", description: "", price: 5.99)
    ]
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         /*navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))*/
        configure()
    }

    func configure() {
        self.foodCollectionView.delegate = self
        self.foodCollectionView.dataSource = self
        self.foodCollectionView.register(FoodCollectionViewCell.nib, forCellWithReuseIdentifier: FoodCollectionViewCell.identifier)
    }
    
    /*@objc func addTapped() {
        let vc = storyboard?.instantiateViewController(identifier: "cart") as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }*/
}

extension FoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.identifier, for: indexPath) as! FoodCollectionViewCell
        cell.title.text = foods[indexPath.row].title
        cell.price.text = "Price: \(foods[indexPath.row].price ?? 0)"
        cell.image.image = foods[indexPath.row].image
        
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
        vc.pTitle = foods[indexPath.row].title!
        vc.pDescription = foods[indexPath.row].description!
        vc.pPrice = foods[indexPath.row].price!
        vc.pImage = foods[indexPath.row].image!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FoodViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wid = (self.view.bounds.width - 10) / 2
        return CGSize(width: wid, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
