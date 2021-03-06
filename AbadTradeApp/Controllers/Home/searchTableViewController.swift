//
//  searchTableViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/18/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import MOLH

//enum Type : String {
//    case Category = "Category"
//    case Brand = "Brand"
//}

class searchTableViewController: UITableViewController {
    
    var searchResultData = [AnyObject]()
    
    var delegate : searchVCProtocol!
    var selectedObject : AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       // searchResultData = [type.rawValue]
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
        return searchResultData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as! searchTableViewCell

        if let categories = searchResultData as? [Category] {
            cell.searchResultLabel.text = MOLHLanguage.currentAppleLanguage() == "en" ? categories[indexPath.row].nameEn : categories[indexPath.row].nameAr
        }
        else if let brands = searchResultData as? [Brand]
        {
            cell.searchResultLabel.text = MOLHLanguage.currentAppleLanguage() == "en" ? brands[indexPath.row].nameEn : brands[indexPath.row].nameAr
        }
        else if let models = searchResultData as? [Model]
        {
            cell.searchResultLabel.text = MOLHLanguage.currentAppleLanguage() == "en" ? models[indexPath.row].nameEn : models[indexPath.row].nameAr
        }
        //******
        else if let years = searchResultData as? [Year]
        {
            cell.searchResultLabel.text = years[indexPath.row].year
        }
        else if let status = searchResultData as? [Status]
        {
            cell.searchResultLabel.text = status[indexPath.row].name
        }
        
       
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedObject = searchResultData[indexPath.row]
        if selectedObject != nil{
            
            if let parent = delegate{
                
                parent.handelSelection(selectedValue: selectedObject!)
                self.navigationController?.popViewController(animated: true)
            }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
