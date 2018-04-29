//
//  VehicleResultTableViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/20/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage
import MOLH

class VehicleResultTableViewController: UITableViewController{
    
    var searchResults = [SearchResultItem]()
    var selectedCategory : Category!
    var selectedBrand : Brand?
    var selectedModel : Model?
    var selectedYear : Year?
    var statusOfVehicle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        tableView.reloadData()
//        search()
        
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
        return searchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleResultCell", for: indexPath) as! VehicleResultTableViewCell

        let currentCellImageUrl = "\(ItemImageURL)\(searchResults[indexPath.row].image!)"
        cell.vehicleBrand.text =
            MOLHLanguage.currentAppleLanguage() == "en" ? searchResults[indexPath.row].brand.nameEn : searchResults[indexPath.row].brand.nameAr
        
        cell.vehicleModel.text =
            MOLHLanguage.currentAppleLanguage() == "en" ? searchResults[indexPath.row].model.nameEn : searchResults[indexPath.row].model.nameAr
        
        cell.vehicleShowRoom.text =
            MOLHLanguage.currentAppleLanguage() == "en" ? searchResults[indexPath.row].dealer?.nameEn : searchResults[indexPath.row].dealer?.nameAr
            
        cell.vehiclePrice.text = searchResults[indexPath.row].price
        cell.vehicleImage.af_setImage(withURL: URL(string: currentCellImageUrl)!)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVehicleResult = searchResults[indexPath.row]
        let storyboard = UIStoryboard.init(name: "VehicleResult", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SelectedVehicleData") as! VehicleDetailsViewController
        print(selectedVehicleResult.id)
        destinationViewController.itemId = selectedVehicleResult.id
        destinationViewController.priceType = selectedVehicleResult.priceType
        self.show(destinationViewController, sender: self)
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
    func search() {
    apiRequests.apisInstance.getSearchResults(categoryId: selectedCategory.id, brandId: selectedBrand?.id ?? "0", modelId: selectedModel?.id ?? "0", yearId: selectedYear?.id ?? "0", status: statusOfVehicle) { (searchResults) in
            self.searchResults = searchResults
            self.tableView.reloadData()
        }
//        self.noResultsLabel.text = (self.searchResults.count > 0 ? "" : "NO_RESULTS")
    }

}
