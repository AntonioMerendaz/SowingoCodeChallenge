//
//  TertiaryTableViewCell.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class TertiaryTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var bestSellerImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var manufacturerNameLabel: UILabel!
    @IBOutlet weak var listPriceValueLabel: UILabel!
    @IBOutlet weak var yourPriceValueLabel: UILabel!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBAction func favoriteButtonPressed(_ sender: Any) {
    }
    func setProduct(product: Product) {
//        if let imageURL = product.mainImage {
//            productImageView?.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
//        }
//        else {
//            productImageView.image = UIImage(named: "placeholder.png")
//        }
        
        let favImg = product.isFavouriteProduct ? "HeartFilled" : "Heart"
        favoriteButtonOutlet.setImage(UIImage(named: favImg), for: .normal)
        
//        if let imageURL = product.mainImage {
//            productImageView?.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
//        }
        
        bestSellerImageView.image = UIImage(named: product.advertisingBadges.badges != nil ? "bestSeller" : "white_1px")
        
        productNameLabel.text = product.subcategory.name
        manufacturerNameLabel.text = product.manufacturer.name
        listPriceValueLabel?.text = String(product.vendorInventory.first?.listPrice ?? 0)
        yourPriceValueLabel?.text = String(product.vendorInventory.first?.price ?? 0)
    }
}
