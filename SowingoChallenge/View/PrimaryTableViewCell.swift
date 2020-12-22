//
//  PrimaryTableViewCell.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var bestSellerImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var manufacturerNameLabel: UILabel!
    @IBOutlet weak var listPriceValueLabel: UILabel!
    @IBOutlet weak var yourPriceValueLabel: UILabel!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    func setProduct(product: Product) {
        setupViews()
        let favImg = product.isFavouriteProduct ? "HeartFilled" : "Heart"
        favoriteButtonOutlet.setImage(UIImage(named: favImg), for: .normal)
        
        if let imageURL = product.mainImage {
            productImageView?.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        }
        else {
            productImageView.image = UIImage(named: "placeholder.png")
        }
        
        bestSellerImageView.image = UIImage(named: product.advertisingBadges.badges != nil ? "bestSeller" : "white_1p")
        
        productNameLabel.text = product.subcategory.name
        manufacturerNameLabel.text = product.manufacturer.name
        listPriceValueLabel?.text = String(product.vendorInventory.first?.listPrice ?? 0)
        yourPriceValueLabel?.text = String(product.vendorInventory.first?.price ?? 0)
    }
    
    func setupViews() {
//        contentView.backgroundColor = .white
//                contentView.layer.borderWidth = 1
//                contentView.layer.borderColor = CGColor(gray: 0.3, alpha: 1)
//                contentView.layer.cornerRadius = 10
//        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
//        contentView.layer.shadowColor = CGColor(gray: 0, alpha: 1)
        self.productImageView.layer.borderWidth = 1
        self.productImageView.layer.borderColor = CGColor(gray: 0.6, alpha: 1)
        self.productImageView.layer.cornerRadius = 10
    }
}
