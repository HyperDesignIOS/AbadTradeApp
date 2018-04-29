//
//  SendMessageViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class ShowRoomSendMessageViewController: UIViewController {
    
    var receiverName : String!
    var msg : String!
    var done : String!
    var generaMetod = GeneralMethod()
    var showRoom : ShowRoomDetails!
    var insurance : Insurance!
    var loggedinUserId : Int!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var sentMessageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiverNameLabel.text = receiverName
        sendButton.setTitle(NSLocalizedString("SENDBUTTON", comment: ""), for: .normal)
        
        messageLabel.text = NSLocalizedString("MESSAGELABEL", comment: "")
        self.navigationItem.title = NSLocalizedString("SENDMESSAGENAVITEM", comment: "")
        
        self.hideKeyboardWhenTappedAround()

    }

    @IBAction func sendButton(_ sender: Any) {
        let  message = sentMessageTextView.text
        if !(message?.isEmpty)! && !(message?.containsWhiteSpace())!{
            apiRequests.apisInstance.sendMessageToShowRoom(message: message!, userId:"\(loggedinUserId!)" , dealerId: showRoom.id, didDataReady: { (msg,done) in
                self.msg = msg
                self.done = done
                if self.done == "1"
                {
                    self.msg = msg
                    let storyboard = UIStoryboard(name: "ShowRooms", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "showRoomVC")
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
            self.generaMetod.showAlert(title: "", message: NSLocalizedString("NOMESSAGEENTERED", comment: ""), vc: self, closure: nil)
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
