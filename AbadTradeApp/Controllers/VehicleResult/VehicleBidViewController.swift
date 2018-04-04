//
//  VehicleBidViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class VehicleBidViewController: UIViewController {

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

}
