//
//  ProductViewController.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var apiService : APIService!
    private var prodData : Products!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.layer.cornerRadius = 10
        self.apiService =  APIService()
        fetchProductsData()
        self.title = "Products"
        
    }
    
    func fetchProductsData() {
        self.apiService.fetchFromServer {
            (prodData) in
            self.prodData = prodData
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prodData?.hits.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 {
            return 334
        } else {
            return 159
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let product = prodData?.hits[indexPath.row] {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PrimaryTableViewCell") as! PrimaryTableViewCell
                if self.prodData != nil {
                    cell.setProduct(product: product)
                }
                
                return cell
            }
            else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TertiaryTableViewCell") as! TertiaryTableViewCell
                cell.setProduct(product: product)
            return cell
            }
        }
        return UITableViewCell()
    }
}
