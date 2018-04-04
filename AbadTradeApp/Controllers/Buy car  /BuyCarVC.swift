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
    var phone : String!
    var email : String!
    var addressar : String!
    var addressen : String!
    var userName : String!

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var PhonTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var addressarTF: UITextField!
    @IBOutlet weak var addessenTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTF.text = userName
        addressarTF.text = addressar
        addessenTF.text = addressen
        PhonTF.text = phone
        emailTF.text = email
    }
    

    @IBAction func BuyButton(_ sender: Any) {
        
        let userId = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.postBuyCar(id: "\(id)", userId: "\(userId)", price: price[0].price,phone : PhonTF.text!, email: emailTF.text!, addressar: addressarTF.text!, addressen: addessenTF.text!) { (msg, done) in
            
            
            
        }
        
    }
    
    

    
}
