//
//  showRoomCollectionViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/25/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage
import MOLH
import SwiftSpinner

class showRoomCollectionViewController: UICollectionViewController {
    var ShowRooms = [ShowRoom]()
    var showRoomDetailsArr = [ShowRoomDetails]()
    var showRoomitems = [ShowRoomItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRooms ()
        //collectionView?.reloadData()
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
        return ShowRooms.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowRoomCell", for: indexPath) as! showRoomCollectionViewCell
        
        cell.roomImage.af_setImage(withURL: URL(string: "\(ShowRoomImageURL)\(ShowRooms[indexPath.row].logo!)")!)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            cell.roomName.text = ShowRooms[indexPath.row].nameEn
        }
        else{
            cell.roomName.text = ShowRooms[indexPath.row].nameAr

        }
        cell.roomNumberOfVehicles.text = "5"
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedShowRoomId = String(ShowRooms[indexPath.row].id)
        apiRequests.apisInstance.getShowRoomDetails(showRoomId: selectedShowRoomId, didDataReady: { (showRoomDetails, items) in
            
            self.showRoomDetailsArr = showRoomDetails
            self.showRoomitems = items
            
            self.performSegue(withIdentifier: "showRoomDetailsSegue", sender: self)
            
        })
            
        
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        performSegue(withIdentifier: "showSideMenu", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRoomDetailsSegue"
        {
            if let destination = segue.destination as? ShowRoomDetailsViewController {
                destination.showRoomsDetails = self.showRoomDetailsArr
                destination.showRoomItems = self.showRoomitems
                
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
    
    func getRooms (){
        SwiftSpinner.show(NSLocalizedString("LOADING", comment: ""))
        apiRequests.apisInstance.getShowRooms{ (showRooms) in
            self.ShowRooms = showRooms
            self.collectionView?.reloadData()
            SwiftSpinner.hide()
        }
    }
    
}


