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
        
        if let vendor = product.vendorInventory.first {
            listPriceValueLabel.attributedText = NSAttributedString(string: "$\(vendor.listPrice)").withStrikeThrough(1)
            listPriceValueLabel.text = "$\(vendor.listPrice)"
        }
        
        yourPriceValueLabel?.text = String(product.vendorInventory.first?.price ?? 0)
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(gray: 0.6, alpha: 1)
        contentView.layer.cornerRadius = 10
        productImageView.layer.borderWidth = 1
        productImageView.layer.borderColor = CGColor(gray: 0.6, alpha: 1)
        productImageView.layer.cornerRadius = 10
    }
}
