//
//  InsuranceDetailsViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/27/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage

class InsuranceDetailsViewController: UIViewController{
    
    
    var insuranceDetails = [Insurance]()
    
    @IBOutlet weak var insuranceDetailsImage: UIImageView!
    
    @IBOutlet weak var insuranceName: UILabel!
    @IBOutlet weak var insuranceAddress: UILabel!
    @IBOutlet weak var insuranceCountry: UILabel!
    @IBOutlet weak var insuranceRegion: UILabel!
    @IBOutlet weak var insuranceArea: UILabel!
    @IBOutlet weak var insuranceWorkTime: UILabel!
    @IBOutlet weak var insuranceAbout: UILabel!
    
    @IBAction func sendRequestButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Insurance", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "insuranceMessageVC") as! insuranceSendMessagVC
        destinationViewController.receiverName = insuranceDetails[0].nameEn
        show(destinationViewController, sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insuranceDetailsImage.af_setImage(withURL: URL(string: "\(InsuranceImageURL)\(insuranceDetails[0].logo!)")!)
         insuranceName.text = insuranceDetails[0].nameEn
        insuranceAddress.text = insuranceDetails[0].addressEn
        insuranceArea.text = insuranceDetails[0].area.nameEn
        insuranceCountry.text = insuranceDetails[0].country.nameEn
        insuranceRegion.text = insuranceDetails[0].region.nameEn
        insuranceWorkTime.text = insuranceDetails[0].workTimes
        insuranceAbout.text = insuranceDetails[0].aboutEn

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
    
}

