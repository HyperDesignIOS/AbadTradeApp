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
    var itemTotalAmount : Double!
    var counter = Int()
    var timer = Timer()
    var priceType : String!
    var user : User!
    var currency = "SAR"
   var generalMethod = GeneralMethod()
    
    @IBOutlet weak var vehicleSlider: ImageSlideshow!
    @IBOutlet weak var bidsButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!
    
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var currentOfferLabel: UILabel!
    var itemId : Int!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        getItems()
        if priceType == "bids"{
            currentOfferLabel.isHidden = false
            endDateLabel.isHidden = false
            currentLabel.isHidden = false
            dateLabel.isHidden = false
            if UserDefaults.standard.isLoggedIn(){
                bidsButton.isHidden = false
                buyButton.isHidden = true
            }
            else{
                bidsButton.setTitle("Login to join bid", for: .normal)
                bidsButton.isHidden = false
                buyButton.isHidden = true
            }
        }
        else{
            currentOfferLabel.isHidden = true
            endDateLabel.isHidden = true
            currentLabel.isHidden = true
            dateLabel.isHidden = true
            if UserDefaults.standard.isLoggedIn(){
                bidsButton.isHidden = true
                buyButton.isHidden = false
            }
            else{
                bidsButton.setTitle("Login to buy", for: .normal)
                bidsButton.isHidden = true
                buyButton.isHidden = false
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if priceType == "bids"{
            updateView()}
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        generalMethod.timerInvalidate()
        if priceType == "bids"{
            timer.invalidate()}
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
    
    @IBAction func buyButton(_ sender: Any) {
        
        
        if UserDefaults.standard.isLoggedIn(){
             let userID = UserDefaults.standard.getUserID()
            let storyboard = UIStoryboard(name: "VehicleResult", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "buyCarVC")
            as! BuyCarVC
                
            //self.present(controller, animated: true, completion: nil)
            
            apiRequests.apisInstance.buyCar(id:String(vehicleItemDetails.id), userId:String(userID), didDataReady: { (user, prices) in
                //self.vehiclePrices = prices
                self.user = user
                controller.user = user
                //controller.email = user.email
               // controller.phone = user.phone as! String!
             //   controller.addressar = user.addressAr as! String!
               // controller.addressen = user.addressEn as! String!
                controller.price = prices
                controller.id = self.vehicleItemDetails.id
               // controller.userName = user.name
                self.show(controller
                    , sender: self)
                
            })
        }
        else
        {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            generalMethod.showAlert(title: "", message: "login first to buy", vc: self, closure: nil)
        }
        
    }
    
    @IBAction func bidButton(_ sender: Any) {
        
        if UserDefaults.standard.isLoggedIn(){
            let storyboard = UIStoryboard(name: "VehicleResult", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "bidViewController") as! VehicleBidViewController
            controller.vehicleBid = self.vehicleBids
            controller.currentItemId = "\(vehicleItemDetails.id!)"
            controller.itemCurrentAmount = self.itemTotalAmount
            self.show(controller, sender: self)
            //self.present(controller, animated: true, completion: nil)
            
//            apiRequests.apisInstance.buyCar(id:String(vehicleItemDetails.id), userId:String(userID), didDataReady: { (user, prices) in
//                self.vehiclePrices = prices
//                self.user = user
//                self.show(controller
//                    , sender: self)
//                
//            })
        }
        else
        {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            self.show(controller, sender: self)
        }
        
    }
    
    
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
        apiRequests.apisInstance.getVehicleItemDetails(selectedVehicleId: String(itemId)) { (item, images, options, prices, bids, itemTotalAmount) in
            
            self.vehicleItemDetails = item
            self.vehiclePrices = prices
            self.vehicleBids = bids
            self.vehicleImages = images
            self.vehicleOptions = options
            self.itemTotalAmount = itemTotalAmount
            self.counter = 4
            self.slider()
            self.endDateLabel.text = self.vehicleBids.endDate
            self.currentOfferLabel.text = "\(self.itemTotalAmount!) \(self.currency)"
//            self.generalMethod.updateView(id: "\(self.vehicleBids.id!)", update: {(total) in
//                self.currentLabel.text = "\(total) \(self.currency)"
//                })
            //print("bid : \(self.vehicleBids.id!)")
            self.tabelView.reloadData()
        }
        
    }
    
    
    func updateView() {
        // Initialize Label
        //        setTimeLeft()
        
        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)

    }

    @objc func setTimeLeft() {
        
        // Only keep counting if timeEnd is bigger than timeNow
        apiRequests.apisInstance.updateCurrentBid(id: "\(itemId!)") { (total) in
            self.currentOfferLabel.text = "\(total) \(self.currency)"
        }
    }
    
}
