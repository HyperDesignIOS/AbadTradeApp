//
//  showRoomDetailsViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/28/18.
//  Copyright © 2018 AmrObjection. All rights reserved.

import UIKit
import AlamofireImage

class ShowRoomDetailsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var showRoomsDetails = [ShowRoomDetails]()
    var showRoomItems = [ShowRoomItem]()

    
    @IBOutlet weak var loginToSendButton: UIButton!
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showRoomImage: UIImageView!
    @IBOutlet weak var showRoomName: UILabel!
    @IBOutlet weak var showRoomAddess: UILabel!
    @IBOutlet weak var showRoomphone: UILabel!
    @IBOutlet weak var showRoomWorkTimes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.isLoggedIn(){
            sendMessageButton.isHidden = false
            loginToSendButton.isHidden = true
        }else{
            loginToSendButton.isHidden = false
            sendMessageButton.isHidden = true
        }
        
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
        
        cell.vehicleModel.text = showRoomItems[indexPath.row].descriptionEn.html2String
        cell.vehicleImage.af_setImage(withURL: URL(string: currentCellImageUrl)!)
        cell.vehicleShowRoom.isHidden = true
        cell.vehiclePrice.text = showRoomItems[indexPath.row].price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedVehicle = showRoomItems[indexPath.row]
        let storyboard = UIStoryboard.init(name: "VehicleResult", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SelectedVehicleData") as! VehicleDetailsViewController
        print(selectedVehicle.id)
        destinationViewController.itemId = selectedVehicle.id
        destinationViewController.priceType = selectedVehicle.priceType
        self.show(destinationViewController, sender: self)
    }
    
    
    @IBAction func sendMessageButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "ShowRooms", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SendMessageVC") as! ShowRoomSendMessageViewController
        destinationViewController.showRoom = showRoomsDetails[0]
        destinationViewController.receiverName = showRoomsDetails[0].nameEn
        destinationViewController.loggedinUserId = UserDefaults.standard.getUserID()
        show(destinationViewController, sender: self)
        
    }
    @IBAction func loginToSendButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
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
