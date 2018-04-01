//
//  SendMessageViewController.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {
    
    var receiverName : String!
    
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
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
        var message = sentMessageTextView.text
        if message != nil && message != ""{
            
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
