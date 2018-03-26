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

class BrandModelCollectionViewController :  UICollectionViewController {
    
    var brands : [Brand]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        cell.cellImage.af_setImage(withURL: URL(string: "\(BrandImageURL)\(brands[indexPath.row].brandImage!)")!)
        cell.cellName.text = brands[indexPath.row].nameEn
        
        return cell
    }
    
    
    
}
