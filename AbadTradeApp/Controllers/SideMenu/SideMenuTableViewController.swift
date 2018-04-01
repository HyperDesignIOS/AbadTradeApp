//
//  SideMenuTableViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/22/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController{
    
    var vehicles : [Category]!
    var sideMenuItemImages = ["home-icon-silhouette","sports-car","car-insurance","sports-car","login","register"]
    var sideMenuItemNames = ["Home","Vehicles","Insurance Companies","Show Rooms","Login", "Register"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sideMenuItemNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuItemCell", for: indexPath) as! SideMenuTableViewCell
        
        cell.sideMenuItemImage.image = UIImage.init(named: sideMenuItemImages[indexPath.row])
        cell.sideMenuItemName.text = sideMenuItemNames[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if sideMenuItemNames[indexPath.row] == "Vehicles"{
            let storyboard = UIStoryboard(name: "Vehicle", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "vehicleVC") as! VehiclesCollectionViewController
            //controller.vehicles = vehicles
            
            //self.present(controller, animated: true, completion: nil)
            show(controller, sender: self)
        }
        else if
            sideMenuItemNames[indexPath.row] == "Show Rooms"{
            
            //performSegue(withIdentifier: "showRoomSegue", sender: self)
            
            let storyboard = UIStoryboard(name: "ShowRooms", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "showRoomVC")
            //self.present(controller, animated: true, completion: nil)
           show(controller, sender: self)
        }
        else if
            sideMenuItemNames[indexPath.row] == "Insurance Companies"{
            
            //performSegue(withIdentifier: "showRoomSegue", sender: self)
            
            let storyboard = UIStoryboard(name: "Insurance", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "insuranceVC")
            //self.present(controller, animated: true, completion: nil)
            show(controller, sender: self)
        }
        else if sideMenuItemNames[indexPath.row] == "Home"
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
            //self.present(controller, animated: true, completion: nil)
            show(controller, sender: self)
            
        }
        else if sideMenuItemNames[indexPath.row] == "Login"
        {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            //self.present(controller, animated: true, completion: nil)
            show(controller, sender: self)
            
        }
        else if sideMenuItemNames[indexPath.row] == "Register"
        {
            let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "RegisterVC")
            //self.present(controller, animated: true, completion: nil)
            show(controller, sender: self)
            
        }
        
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "VehiclesFromSideMenuSegue" {
            
            if let destination = segue.destination as? VehiclesCollectionViewController{
                destination.vehicles = self
                    .vehicles
                //destination.collectionView?.reloadData()
            }
        }
    }
}


