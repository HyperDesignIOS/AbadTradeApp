//
//  BuyCarVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class BuyCarVC: UIViewController {
    
    var id : Int!
    var price : [VehiclePrice]!
    var user : User!
    var selectedPrice : String!
    var general = GeneralMethod()

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var PhonTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var addressarTF: UITextField!
    @IBOutlet weak var addessenTF: UITextField!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstPriceLabel: UILabel!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var secondPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstPriceLabel.text = price[0].price
        secondPriceLabel.text = price[1].price
        nameTF.text = user.name
      //  addressarTF.text = addressar
       // addessenTF.text = addressen
       // PhonTF.text = phone
        emailTF.text = user.email
    }
    
    
    @IBAction func priceRadioButton(_ sender: UIButton) {
        
        switch sender.tag{
        case 0:
            imageSwap(forfirstimage: firstImage, andSecondImage: secondImage)
            selectedPrice = price[0].id
            
        case 1:
            imageSwap(forfirstimage: secondImage, andSecondImage: firstImage)
            selectedPrice = price[1].id
            
        default:
            break
        }
    }
    

    @IBAction func BuyButton(_ sender: Any) {
        
        let userId = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.postBuyCar(id: "\(id!)", userId: "\(user.id!)", price: selectedPrice!,phone : PhonTF.text!, email: emailTF.text!, addressar: addressarTF.text!, addressen: addessenTF.text!) { (msg, done) in
            
            if done == "1"
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                //self.present(controller, animated: true, completion: nil)
                self.show(controller, sender: self)
                
                self.general.showAlert(title: "", message: msg, vc:self, closure:nil )
            }
            else
            {
                
                self.general.showAlert(title: "", message: msg, vc:self, closure:nil )
            }
            
        }
        
    }

    func imageSwap(forfirstimage firstImageView: UIImageView,andSecondImage secondImageView: UIImageView)
    {
        firstImageView.image = UIImage(named: "radio-on-button")
        secondImageView.image = UIImage(named: "empty")
        
    }
    
}
