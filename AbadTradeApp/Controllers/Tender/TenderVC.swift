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
    var generalMethod = GeneralMethod()
   
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tenderLabel: UILabel!
    
    @IBOutlet weak var tenderMessage: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenderLabel.text = label
   
        setStyle()
    self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func tenderSideMenuButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuNavID")
        show(controller, sender: self)

    }
    
    func setStyle(){
        
        messageLabel.text = NSLocalizedString("MESSAGELABEL", comment: "")
    sendButton.setTitle(NSLocalizedString("SENDBUTTON", comment: ""), for: .normal)
        
    self.navigationItem.title = NSLocalizedString("TENDER", comment: "")
        
    }
    
    
    @IBAction func sendTenderButton(_ sender: Any) {
        
        let message = tenderMessage.text
        if ((message?.isEmpty)! || (message?.containsWhiteSpace())!){
       
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOMESSAGEENTERED", comment: ""), vc: self, closure: nil)
        }
        else
        {
            let user_id = UserDefaults.standard.getUserID()
            apiRequests.apisInstance.sendTender(message: tenderMessage.text, userId: String(user_id), didDataReady: { (msg,done) in
                self.msg = msg
                if done == "1"
                {
                    self.generalMethod.showAlert(title: "", message: msg, vc: self, closure: {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                        self.show(controller, sender: self)
                    })
                }
            })
        }
    }
}
