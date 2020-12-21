//
//  PrimaryTableViewCell.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var manufacturerNameLabel: UILabel!
    @IBOutlet weak var listPriceValueLabel: UILabel!
    @IBOutlet weak var yourPriceValueLabel: UILabel!
    
    func setProduct(product: Product) {
        productImageView.image = UIImage(named: "placeholder")
        productNameLabel.text = product.subcategory.name
        manufacturerNameLabel.text = product.manufacturer.name
//        print("List Price: \(product.vendorInventory.first?.listPrice ?? 0)")
//        print("Your Price: \(product.vendorInventory.first?.price ?? 0)")
        listPriceValueLabel?.text = String(product.vendorInventory.first?.listPrice ?? 0)
        yourPriceValueLabel?.text = String(product.vendorInventory.first?.price ?? 0)
    }
    
}
