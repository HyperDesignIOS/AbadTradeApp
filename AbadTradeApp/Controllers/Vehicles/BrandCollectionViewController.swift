//
//  BrandModelCollectionViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/26/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import MOLH

class BrandCollectionViewController :  UICollectionViewController {
    
    var brands : [Brand]!
    var selectedCategory : Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("BRAND", comment: "")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        cell.cellImage.af_setImage(withURL: URL(string: "\(BrandImageURL)\(brands[indexPath.row].brandImage!)")!)
        cell.cellName.text = MOLHLanguage.currentAppleLanguage() == "en" ? brands[indexPath.row].nameEn : brands[indexPath.row].nameAr
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedBrand = brands[indexPath.row]
        apiRequests.apisInstance.getModels(brandId: selectedBrand.id) { (models) in
            
            let storyboard = UIStoryboard.init(name: "Vehicle", bundle: nil)
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ModelsTableController") as! ModelsTableViewController
            
            destinationViewController.models = models
//            destinationViewController.selectedBrandImageName = selectedBrand.brandImage
            destinationViewController.selectedCategory = self.selectedCategory
            destinationViewController.selectedBrand = selectedBrand
            destinationViewController.tableView.reloadData()
            self.show(destinationViewController, sender: self)
        }
    }
}
