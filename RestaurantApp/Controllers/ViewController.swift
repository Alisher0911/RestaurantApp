//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Alisher on 2/25/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showFoods(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "food") as! FoodViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showDrinks(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "drink") as! DrinkViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

