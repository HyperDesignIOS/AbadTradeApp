//
//  showRoomDetailsViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/28/18.
//  Copyright © 2018 AmrObjection. All rights reserved.

import UIKit
import AlamofireImage

class showRoomDetailsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var showRoomsDetails = [showRoomDetail]()
    var showRoomItems = [ShowRoomItem]()

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showRoomImage: UIImageView!
    @IBOutlet weak var showRoomName: UILabel!
    @IBOutlet weak var showRoomAddess: UILabel!
    @IBOutlet weak var showRoomphone: UILabel!
    @IBOutlet weak var showRoomWorkTimes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableView.delegate = self
        tableView.dataSource = self
        showRoomImage.af_setImage(withURL: URL(string: "\(ShowRoomImageURL)\(showRoomsDetails[0].logo!)")!)
        showRoomName.text = showRoomsDetails[0].nameEn
        showRoomAddess.text = showRoomsDetails[0].addressEn
        showRoomphone.text = showRoomsDetails[0].phone
        showRoomWorkTimes.text = showRoomsDetails[0].workTimes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showRoomItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleResultCell") as!VehicleResultTableViewCell
        let currentCellImageUrl = "\(ItemImageURL)\(showRoomItems[indexPath.row].image!)"
        cell.vehicleBrand.text = showRoomItems[indexPath.row].nameEn
        
        cell.vehicleModel.text = showRoomItems[indexPath.row].descriptionEn
        cell.vehicleImage.af_setImage(withURL: URL(string: currentCellImageUrl)!)        
        
        
        return cell
    }
    
    
    @IBAction func sendMessageButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "ShowRooms", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SendMessageVC") as! SendMessageViewController
        destinationViewController.receiverName = showRoomsDetails[0].nameEn
        show(destinationViewController, sender: self)
    }
    //    let currentCellImageUrl = "\(ItemImageURL)\(searchResults[indexPath.row].image!)"
//    cell.vehicleBrand.text = searchResults[indexPath.row].brand.nameEn
//    cell.vehicleModel.text = searchResults[indexPath.row].model.nameEn
//    cell.vehicleShowRoom.text = searchResults[indexPath.row].dealer?.nameEn
//    cell.vehiclePrice.text = searchResults[indexPath.row].price
//    cell.vehicleImage.af_setImage(withURL: URL(string: currentCellImageUrl)!)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
