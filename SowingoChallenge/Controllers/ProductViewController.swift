//
//  ProductViewController.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    private var apiService: APIService!
    private var prodData: Products!
    private var prodDataFiltered: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
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
            self.prodDataFiltered = prodData.hits
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.refresher.endRefreshing()
            }
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prodDataFiltered?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 {
            return ConstantsEnum.cardPrimaryRowHeight
        } else {
            return ConstantsEnum.cardTertiaryRowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let product = prodDataFiltered?[indexPath.row] {
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
        prodDataFiltered[indexPath.row].isFavouriteProduct = !prodDataFiltered[indexPath.row].isFavouriteProduct
        self.tableView.reloadData()
    }
    
    //MARK: Search Bar config:
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        prodDataFiltered = []
        if searchText == "" {
            prodDataFiltered = prodData.hits
        }
        for prod in prodData.hits {
            if prod.subcategory.name.lowercased().contains(searchText.lowercased()) {
                prodDataFiltered.append(prod)
            }
        }
        self.tableView.reloadData()
    }
}


