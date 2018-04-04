//
//  BuyCarVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class BuyCarVC: UIViewController {
    
    var id : String!
    var userid: String!
    var price : String!
    var phone : String!
    var email : String!
    var addressar : String!
    var addressen : String!

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var PhonTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var addressarTF: UITextField!
    @IBOutlet weak var addessenTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func BuyButton(_ sender: Any) {
        let name = nameTF.text
        let phone = PhonTF.text
        let email = emailTF.text
        let addressAR = addressarTF.text
        let addressEN = addessenTF.text
        
        apiRequests.apisInstance.postBuyCar(id: <#T##String#>, userId: <#T##String#>, price: <#T##String#>, phone: <#T##String#>, email: <#T##String#>, addressar: <#T##String#>, addressen: <#T##String#>, didDataReady: <#T##(String, String) -> ()#>)
        
    }
    
    

    
}
