//
//  InsuranceDetailsViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/27/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage
import MOLH

class InsuranceDetailsViewController: UIViewController{
    
    
    var insuranceDetails = [Insurance]()
    
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var loginToSendButton: UIButton!
    @IBOutlet weak var insuranceDetailsImage: UIImageView!
    
    @IBOutlet weak var insuranceName: UILabel!
    @IBOutlet weak var insuranceAddress: UILabel!
    @IBOutlet weak var insuranceCountry: UILabel!
    @IBOutlet weak var insuranceRegion: UILabel!
    @IBOutlet weak var insuranceArea: UILabel!
    @IBOutlet weak var insuranceWorkTime: UILabel!
    @IBOutlet weak var insuranceAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insuranceDetailsImage.af_setImage(withURL: URL(string: "\(InsuranceImageURL)\(insuranceDetails[0].logo!)")!)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            insuranceName.text = insuranceDetails[0].nameEn
            insuranceAddress.text = insuranceDetails[0].addressEn
            insuranceArea.text = insuranceDetails[0].area.nameEn
            insuranceCountry.text = insuranceDetails[0].country.nameEn
            insuranceRegion.text = insuranceDetails[0].region.nameEn
            insuranceAbout.text = insuranceDetails[0].aboutEn.html2String
        }
        else{
            insuranceName.text = insuranceDetails[0].nameAr
            insuranceAddress.text = insuranceDetails[0].addressAr
            insuranceArea.text = insuranceDetails[0].area.nameAr
            insuranceCountry.text = insuranceDetails[0].country.nameAr
            insuranceRegion.text = insuranceDetails[0].region.nameAr
            insuranceAbout.text = insuranceDetails[0].aboutAr.html2String

        }
        insuranceWorkTime.text = insuranceDetails[0].workTimes

        if UserDefaults.standard.isLoggedIn(){
            sendMessageButton.setTitle(NSLocalizedString("SENDMESSAGENAVITEM", comment: ""), for: .normal)
            sendMessageButton.isHidden = false
            loginToSendButton.isHidden = true
        }else{
            loginToSendButton.setTitle(NSLocalizedString("LOGINTOSENDMESSAGE", comment: ""), for: .normal)
            loginToSendButton.isHidden = false
            sendMessageButton.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendRequestButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Insurance", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "InsuranceSendMessageVC") as! InsuranceSendMessageViewController
        destinationViewController.insurance = insuranceDetails[0]
        if MOLHLanguage.currentAppleLanguage() == "en"{
            destinationViewController.receiverName = insuranceDetails[0].nameEn
        }
        else{
            destinationViewController.receiverName = insuranceDetails[0].nameAr

        }
        destinationViewController.loggedinUserId = UserDefaults.standard.getUserID()
        show(destinationViewController, sender: self)
        
    }
  
    @IBAction func loginToSendButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        show(destinationViewController, sender: self)
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

