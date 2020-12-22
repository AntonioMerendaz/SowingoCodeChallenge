//
//  ProductViewController.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    private var apiService : APIService!
    private var prodData : Products!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiService =  APIService()
        fetchProductsData()
        self.title = "Products"
        tableView.refreshControl = refresher
    }
    
    @objc
    func requestData() {
        fetchProductsData()
    }
    
    func fetchProductsData() {
        self.apiService.fetchFromServer {
            (prodData) in
            self.prodData = prodData
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.refresher.endRefreshing()
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
            return 336
        } else {
            return 161
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let product = prodData?.hits[indexPath.row] {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PrimaryTableViewCell") as! PrimaryTableViewCell
                if self.prodData != nil {
                    cell.setProduct(product: product)
                }
                let backgroundView = UIView()
                backgroundView.backgroundColor = UIColor.clear
                cell.selectedBackgroundView = backgroundView
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        prodData.hits[indexPath.row].isFavouriteProduct = !prodData.hits[indexPath.row].isFavouriteProduct
        self.tableView.reloadData()
    }
}


