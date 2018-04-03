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
         insuranceName.text = insuranceDetails[0].nameEn
        insuranceAddress.text = insuranceDetails[0].addressEn
        insuranceArea.text = insuranceDetails[0].area.nameEn
        insuranceCountry.text = insuranceDetails[0].country.nameEn
        insuranceRegion.text = insuranceDetails[0].region.nameEn
        insuranceWorkTime.text = insuranceDetails[0].workTimes
        insuranceAbout.text = insuranceDetails[0].aboutEn

        if UserDefaults.standard.isLoggedIn(){
            sendMessageButton.isHidden = false
            loginToSendButton.isHidden = true
        }else{
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
        
        let storyboard = UIStoryboard.init(name: "ShowRooms", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SendMessageVC") as! SendMessageViewController
        destinationViewController.isShowRoom = false
        destinationViewController.receiverName = insuranceDetails[0].nameEn
        show(destinationViewController, sender: self)
        
    }
  
    @IBAction func loginToSendButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        //        destinationViewController.receiverName = showRoomsDetails[0].nameEn
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

