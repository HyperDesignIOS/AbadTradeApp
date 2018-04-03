//
//  InsuranceSendMessageViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/3/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class InsuranceSendMessageViewController: UIViewController {

    var receiverName : String!
    var msg : String!
    var done : String!
    var generaMetod = GeneralMethod()
    var insurance : Insurance!
    var loggedinUserId : Int!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var sentMessageTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        receiverNameLabel.text = receiverName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendButton(_ sender: Any) {
        
        let  message = sentMessageTextView.text
        if message != nil && message != "" && phoneTextField.text != nil && phoneTextField.text != ""{
            apiRequests.apisInstance.sendMessageToInsurance(phone:phoneTextField.text!,message: message!, userId:"\(loggedinUserId!)" , insuranceId: "\(insurance.id!)", didDataReady: { (msg,done) in
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
            self.generaMetod.showAlert(title: "", message:"Please enter your message and phone", vc: self, closure: nil)
        }
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
