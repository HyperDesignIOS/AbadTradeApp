//
//  insuranceSendMessagVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/2/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class insuranceSendMessagVC: UIViewController {
    
    
    
    var receiverName : String!

    var msg : String!
    var done : String!
    var generaMetod = GeneralMethod()

    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var sentMessageTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func sendMessagToInsurance(_ sender: Any) {
        
        let  messageSent = self.sentMessageTextView.text
        if messageSent != nil && messageSent != ""{
            apiRequests.apisInstance.sendMessageToInsurance(phone:"011111555",message: messageSent!, userId:"1" , insuranceId: "1", didDataReady: { (msg,done) in
                self.msg = msg
                self.done = done
                if self.done == "1"
                {
                    self.msg = msg
                    print (self.msg)
                    let storyboard = UIStoryboard(name: "Insurance", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "insuranceVC")
                    //self.present(controller, animated: true, completion: nil)
                    self.show(controller, sender: self)
                    self.generaMetod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
                }
                else if self.done == "0"
                {
                    self.msg = msg
                    self.generaMetod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
                }
            })
            
        }
        else
        {
            self.generaMetod.showAlert(title: "", message:"enter your message", vc: self, closure: nil)
        }
        
    }
    
}
