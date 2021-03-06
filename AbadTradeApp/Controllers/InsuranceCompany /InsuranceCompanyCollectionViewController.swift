//
//  InsuranceCompanyCollectionViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/25/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage
import MOLH
import SwiftSpinner


class InsuranceCompanyCollectionViewController: UICollectionViewController {
    
    var insuranceCompanies = [Insurance] ()
    var insuranceDetails = [Insurance]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getInsurances()
        //collectionView?.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
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
        return insuranceCompanies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "insuranceCell", for: indexPath)
            
            as! InsuranceCompanyCollectionViewCell
        
        cell.InsuranceImage.af_setImage(withURL: URL(string: "\(InsuranceImageURL)\(insuranceCompanies[indexPath.row].logo!)")!)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            cell.insuranceAddress.text = insuranceCompanies[indexPath.row].addressEn
            cell.insuranceName.text = insuranceCompanies[indexPath.row].nameEn
        }
        
        else{
            cell.insuranceAddress.text = insuranceCompanies[indexPath.row].addressAr
            cell.insuranceName.text = insuranceCompanies[indexPath.row].nameAr

        }
        // Configure the cell
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InsuranceCompanyCollectionViewCell
        
        // Configure the cell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedInsuranceId = String(insuranceCompanies[indexPath.row].id)
        apiRequests.apisInstance.getInsuranceDetails(insuranceId: selectedInsuranceId) { (selectedInsuranceDetails) in
            
            self.insuranceDetails = selectedInsuranceDetails
            
           self.performSegue(withIdentifier: "insuranceDetailsSegue", sender: self)
        }
        
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        performSegue(withIdentifier: "insuranceSideMenu", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "insuranceDetailsSegue"
        {
            if let destination = segue.destination as? InsuranceDetailsViewController {
                destination.insuranceDetails = self.insuranceDetails
                
            }
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
    
    func getInsurances(){
        SwiftSpinner.show(NSLocalizedString("LOADING", comment: ""))
        apiRequests.apisInstance.getInsuranceCompany { (insuranceCO) in
            self.insuranceCompanies = insuranceCO
            self.collectionView?.reloadData()
            SwiftSpinner.hide()
        }
    }
    
}

