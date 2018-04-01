//
//  VehicleDetailsViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/29/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import ImageSlideshow
import AlamofireImage


class VehicleDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var vehiclePrices = [VehiclePrice]()
    var vehicleImages = [VehicleImage]()
    var vehicleOptions = [VehicleOption]()
    var vehicleBids : VehicleBid!
    var vehicleItemDetails : VehicleItemDetails!
    var counter = Int()
    
    @IBOutlet weak var vehicleSlider: ImageSlideshow!
    
    @IBOutlet weak var tabelView: UITableView!
    
    var itemId : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        getItems()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return counter
        case 1:
            return vehiclePrices.count
        default:
            return vehicleOptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "vehicleDetailsCell") as! VehicleDetailsTableViewCell
         
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.vehicleDataKey.text = "Brand"
                cell.vehicleDtaValue.text = vehicleItemDetails.brand.nameEn
            case 1:
                cell.vehicleDataKey.text = "Model"
                cell.vehicleDtaValue.text = vehicleItemDetails.model.nameEn
            case 2:
                cell.vehicleDataKey.text = "Year"
                cell.vehicleDtaValue.text = vehicleItemDetails.modYear.year
            default:
                cell.vehicleDataKey.text = "Status"
                cell.vehicleDtaValue.text = vehicleItemDetails.status
            }
//            cell.vehicleDataKey.text = "lesa"
//            cell.vehicleDtaValue.text = "api"
        case 1:
            cell.vehicleDataKey.text = vehiclePrices[indexPath.row].nameEn
            cell.vehicleDtaValue.text = vehiclePrices[indexPath.row].price
        default:
            cell.vehicleDataKey.text = vehicleOptions[indexPath.row].nameEn
            cell.vehicleDtaValue.text = vehicleOptions[indexPath.row].valueEn
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Vehicle description: "
        case 1:
            return "Vehicle prices:"
        default:
            return "Vehicle features:"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: 15)!
        header.textLabel?.textColor = UIColor.red
        header.textLabel?.textAlignment = .center
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func slider(){
        var downloadedImages = [InputSource]()
        for var i in (0 ..< vehicleImages.count) {
            downloadedImages.append(AlamofireSource(urlString: "\(ItemImageURL)\(vehicleImages[i].image!)")!)
        }
        vehicleSlider.setImageInputs(downloadedImages)
        vehicleSlider.slideshowInterval = 2
        //        slideShow.zoomEnabled = true
        //    slideShow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

    func getItems(){
        apiRequests.apisInstance.getVehicleItemDetails(selectedVehicleId: String(itemId)) { (item, images, options, prices, bids) in
            
            self.vehicleItemDetails = item
            self.vehiclePrices = prices
            self.vehicleBids = bids
            self.vehicleImages = images
            self.vehicleOptions = options
            self.counter = 4
            self.slider()
            self.tabelView.reloadData()
        }
        
    }
    
}