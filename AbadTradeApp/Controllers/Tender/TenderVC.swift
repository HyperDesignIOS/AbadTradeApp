//
//  TenderVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/2/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class TenderVC: UIViewController {
    
    var msg: String!
    var label :String!
    var  generalMethod = GeneralMethod()
   
    @IBOutlet weak var tenderLabel: UILabel!
    
    @IBOutlet weak var tenderMessage: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       tenderLabel.text = label
    }
    
    @IBAction func sendTenderButton(_ sender: Any) {
        
        let message = tenderMessage.text
        if ((message?.isEmpty)! || (message?.containsWhiteSpace())!){
       
            generalMethod.showAlert(title: "", message: "please enter your message", vc: self, closure: nil)
        }
        else
        {
            let user_id = UserDefaults.standard.getUserID()
            apiRequests.apisInstance.sendTender(message: tenderMessage.text, userId: String(user_id), didDataReady: { (msg) in
                self.msg = msg
                if self.msg == "Sucess Message Send"
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                    //self.present(controller, animated: true, completion: nil)
                    self.show(controller, sender: self)
                    self.generalMethod.showAlert(title: "", message: "message sent successfully", vc: self, closure: nil)
                }
            })
        }
    }
}
