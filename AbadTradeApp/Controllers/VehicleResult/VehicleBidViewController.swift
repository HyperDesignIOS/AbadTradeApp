//
//  VehicleBidViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class VehicleBidViewController: UIViewController {
    
    var timeEnd : Date!
    var timeNow : Date!
    var timer = Timer()
    var isEnded = false
    var dayText : String!
    var hourText : String!
    var minuteText : String!
    var secondText : String!
    var vehicleBid : VehicleBid!
    var itemCurrentAmount : Double!
    var currentItemId = String()
    let formater = DateFormatter()
    var general = GeneralMethod()
    var currency = "SAR"
    

    @IBOutlet weak var maxBidLabel: UILabel!
    @IBOutlet weak var minBidLabel: UILabel!
    @IBOutlet weak var userOfferTextField: UITextField!
    @IBOutlet weak var currentOffer: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
//    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()

//        formater.dateFormat = "yyyy-MM-dd"
//        timeNow = formater.date(from: vehicleBid.startDate)
//        timeEnd = formater.date(from: vehicleBid.endDate)
        maxBidLabel.text = vehicleBid.maximumBid
        minBidLabel.text = vehicleBid.minimumBid
        currentOffer.text = "\(itemCurrentAmount!) \(currency)"
        endDateLabel.text = vehicleBid.endDate
//        self.general.updateView(id: "\(self.vehicleBid.id!)", update: {(total) in
//            self.currentOffer.text = "\(total) \(self.currency)"
//        })
        updateView()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendBidButton(_ sender: Any) {
        
        let enteredOffer = userOfferTextField.text
        if !(enteredOffer?.isEmpty)! || (enteredOffer?.containsWhiteSpace())!{
            if Int(enteredOffer!)! <= Int(vehicleBid.minimumBid)!{
                general.showAlert(title: "", message: NSLocalizedString("SMALLERTHANMINOFFERENTERED", comment: ""), vc: self, closure: nil)
            }
            else if Int(enteredOffer!)! >= Int(vehicleBid.maximumBid)!{
                general.showAlert(title: "", message: NSLocalizedString("BIGGERTHANMAXOFFERENTERED", comment: ""), vc: self, closure: nil)
            }
//            else if Int(enteredOffer!)! < Int(itemCurrentAmount)
//            {
//                general.showAlert(title: "", message: NSLocalizedString("SMALLERTHANCURRENTOFFERENTERED", comment: ""), vc: self, closure: nil)
//            }
//
            else{
                apiRequests.apisInstance.addAuctionForCarBid(id: currentItemId, userId: "\(UserDefaults.standard.getUserID())", value: enteredOffer!, didDataReady: { (msg, total) in
                    self.general.showAlert(title: "", message: "\(msg)", vc: self, closure: nil)
                    self.currentOffer.text = total
                    self.userOfferTextField.text = ""
                })
            }
        }
        else{
            general.showAlert(title: "", message: NSLocalizedString("NOOFFERENTERED", comment: ""), vc: self, closure: nil)
        }
    }

    func updateView() {

        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)

    }

    @objc func setTimeLeft() {

        // Only keep counting if timeEnd is bigger than timeNow
        apiRequests.apisInstance.updateCurrentBid(id: currentItemId) { (total) in
            self.currentOffer.text = "\(total) \(self.currency)"
        }
    }

}
