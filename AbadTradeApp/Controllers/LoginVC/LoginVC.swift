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

    }

  
    @IBAction func loginButton(_ sender: UIButton) {
        
        let mail = self.email.text!
        if mail.isEmpty {
            generalMethod.showAlert(title: "", message: "please enter your mail", vc: self, closure: nil)
            return
        }
        
        let password = self.password.text!
        if password.isEmpty {
            generalMethod.showAlert(title: "", message: "please enter your password", vc: self, closure: nil)
            return
            
        }
        
        apiRequests.apisInstance.login( userMail:mail , userPassword:password) { (user,msg,done) in
       
            self.msg = msg
            self.done = done
          //  print(self.user.name)
            if self.done == "1"{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                //self.present(controller, animated: true, completion: nil)
                self.show(controller, sender: self)
               self.user = user as! User
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
