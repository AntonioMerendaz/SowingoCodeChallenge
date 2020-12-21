//
//  ProductViewController.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import UIKit

class ProductViewController: UIViewController {

    private var apiService : APIService!
    private var prodData : Products!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiService =  APIService()
        fetchProductsData()
        self.title = "Products"
        
    }
    
    func fetchProductsData() {
        self.apiService.fetchFromServer {
            (prodData) in
            self.prodData = prodData
            print(self.prodData!)
        }
    }

}

