//
//  LoginVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var generalMethod = GeneralMethod()
    var user : User!
    var msg: String!
    var done: String!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func LoginSideMenu(_ sender: Any) {
        performSegue(withIdentifier: "loginSideMenu", sender: self
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

    }

  
    @IBAction func loginButton(_ sender: UIButton) {
        
        let mail = self.email.text!
        if mail.isEmpty || mail.containsWhiteSpace(){
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOEMAILENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        
        let password = self.password.text!
        if password.isEmpty || password.containsWhiteSpace(){
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        
        apiRequests.apisInstance.login( userMail:mail , userPassword:password) { (user,msg,done) in
       
            self.msg = msg
            self.done = done
            if self.done == "1"{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                self.show(controller, sender: self)
               self.user = user
                UserDefaults.standard.setUserID(value: self.user.id)
                UserDefaults.standard.setLoggedIn(value: true)
            }
            else if self.done == "0"
            {
                self.generalMethod.showAlert(title: "", message: self.msg, vc: self, closure: nil)
            }
        }
    }
}
