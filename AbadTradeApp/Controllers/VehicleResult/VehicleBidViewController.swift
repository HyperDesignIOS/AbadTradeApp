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

    @IBOutlet weak var maxBidLabel: UILabel!
    @IBOutlet weak var minBidLabel: UILabel!
    @IBOutlet weak var userOfferTextField: UITextField!
    @IBOutlet weak var currentOffer: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendBidButton(_ sender: Any) {
    }
    
    func updateView() {
        // Initialize Label
        //setTimeLeft()
        
        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimeLeft), userInfo: nil, repeats: true)
    }
    
    @objc func setTimeLeft() {
        
        // Only keep counting if timeEnd is bigger than timeNow
        if timeEnd.compare(timeNow) == ComparisonResult.orderedDescending {
            isEnded = false
            let calendar = NSCalendar.current
            
            let components = calendar.dateComponents([.day, .hour, .minute, .second], from: timeNow, to: timeEnd)
            
            dayText = "\(components.day!)d "
            hourText = "\(components.hour!)h "
            
            // Hide day and hour if they are zero
            if components.day! <= 0 {
                dayText = ""
                if components.hour! <= 0 {
                    hourText = ""
                }
            }
            minuteText = "\(components.minute!)m "
            secondText = "\(components.second!)s "
            timerLabel.text = "\(dayText)\(hourText)\(minuteText)\(secondText)"
            
        } else {
            timerLabel.text = "Ended"
        }
    }

}
