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
    private var prodFavActive: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        self.apiService =  APIService()
        fetchProductsData()
        hideKeyboardWhenTappedAround()
    }
    
    func initialSetup() {
        self.title = "Products"
        self.searchBar.delegate = self
        self.tableView.refreshControl = refresher
        self.tableView.keyboardDismissMode = .onDrag
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
            self.prodFavActive = prodData.hits
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.refresher.endRefreshing()
            }
        }
    }
    
    //MARK - IBActions
    @IBAction func filterButtonPressed(_ sender: UIBarButtonItem) {
        prodFavActive = []
        for prod in prodDataFiltered {
            if prod.isFavouriteProduct {
                prodFavActive.append(prod)
            }
        }
        self.prodDataFiltered = prodFavActive
        self.tableView.reloadData()
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
                cell.favoriteButtonOutlet.tag = indexPath.row
                cell.favoriteButtonOutlet.addTarget(self, action: #selector(ProductViewController.favoriteButtonTapped(_:)), for: .touchUpInside)
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
                cell.favoriteButtonOutlet.tag = indexPath.row
                cell.favoriteButtonOutlet.addTarget(self, action: #selector(ProductViewController.favoriteButtonTapped(_:)), for: .touchUpInside)
                cell.setProduct(product: product)
            return cell
            }
        }
        return UITableViewCell()
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton!) {
        prodDataFiltered[sender.tag].isFavouriteProduct = !prodDataFiltered[sender.tag].isFavouriteProduct
        self.tableView.reloadData()
//        self.apiService.postOnServer()
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
 }
