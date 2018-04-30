//
//  VehiclesCollectionViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/22/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage
import MOLH
import SwiftSpinner

class VehiclesCollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    @IBAction func sideMenuButton(_ sender: Any) {
        
        performSegue(withIdentifier:"vehicleSideMenu", sender: self)
    }
    
    var vehicles : [Category] = []
    var brands : [Brand]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show(NSLocalizedString("LOADING", comment: ""))
        getVehicles()
        
        self.navigationItem.title = NSLocalizedString("VEHICLE", comment: "")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
//        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return vehicles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.cellImage.af_setImage(withURL: URL(string: "\(CategoryImageURL)\(vehicles[indexPath.row].categoryImage!)")!)
        cell.cellName.text = MOLHLanguage.currentAppleLanguage() == "en" ? vehicles[indexPath.row].nameEn : vehicles[indexPath.row].nameAr 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = vehicles[indexPath.row]
        SwiftSpinner.show(NSLocalizedString("LOADING", comment: ""))
        apiRequests.apisInstance.getBrands(vehicleId: selectedCategory.id) { (brands) in
            self.brands = brands
            
            let storyboard = UIStoryboard.init(name: "Vehicle", bundle: nil)
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "BrandCollectionController") as! BrandCollectionViewController
            
            destinationViewController.brands = brands
            destinationViewController.selectedCategory = selectedCategory
            destinationViewController.collectionView?.reloadData()
            SwiftSpinner.hide()
            self.show(destinationViewController, sender: self)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    func getVehicles (){
        
        apiRequests.apisInstance.loadCategoriesAndImages { (vehicles, images) in
            self.vehicles = vehicles
            self.collectionView?.reloadData()
            SwiftSpinner.hide()
        }
    }
}
